# Unity iOS打包Xcode自动构建

## 1. UnityEditor.iOS.Xcode  
代码：
```C#
using System.IO;
using UnityEditor;
using UnityEditor.iOS.Xcode;
using UnityEditor.Callbacks;
using System.Collections;
public class IOSAutomaticPackaging｛
    [PostProcessBuild(999)]  
    public static void OnPostprocessBuild(BuildTarget BuildTarget, string path)  
    ｛  
        if (BuildTarget == BuildTarget.iOS)  
        ｛  
            string projPath = PBXProject.GetPBXProjectPath(path);  
            PBXProject proj = new PBXProject();  
            proj.ReadFromString(File.ReadAllText(projPath));  
            // 获取当前项目名字  
            string target = proj.TargetGuidByName(PBXProject.GetUnityTargetName());  
            // 对所有的编译配置设置选项  
            proj.SetBuildProperty(target, "ENABLE_BITCODE", "NO");
            // 添加依赖库  
            proj.AddFrameworkToProject(target, "CoreFoundation.framework", false);  
            proj.AddFrameworkToProject(target, "AdSupport.framework", false);  
            proj.AddFrameworkToProject(target, "Security.framework", false);  
            proj.AddFrameworkToProject(target, "MobileCoreServices.framework", false); 
            proj.AddFrameworkToProject(target, "CoreTelephony.framework", false);  
            proj.AddFrameworkToProject(target, "UserNotifications.framework", false); 
            proj.AddFrameworkToProject(target, "libresolv.tbd", false); 
            proj.AddFrameworkToProject(target, "libz.tbd", false);  
            proj.AddFrameworkToProject(target, "libc++.1.dylib", false);  
            // 保存工程  
            proj.WriteToFile(projPath);  
            // 修改plist  
            string plistPath = path + "/Info.plist";  
            PlistDocument plist = new PlistDocument();  
            plist.ReadFromString(File.ReadAllText(plistPath));  
            PlistElementDict rootDict = plist.root;  
            // 语音所需要的声明，iOS10必须  
            rootDict.SetString("NSContactsUsageDescription", "是否允许此游戏使用麦克风");  
            rootDict.SetString("Privacy - Camera Usage Description", "是否允许使用相机");
            rootDict.SetString("Privacy - Location When In Use Usage Description", "是否允许使用定位");
            rootDict.SetString("Privacy - Photo Library Additions Usage Description", "保存截图到相册，需要访问你的相册");
            rootDict.SetString("Privacy - Photo Library Usage Description","保存截图到相册，需要访问你的相册");
            rootDict.SetString("Privacy - Music Usage Description", "是否允许访问媒体资料库");
            // 保存plist  
            plist.WriteToFile(plistPath);  
        ｝  
    ｝  
｝
```