# vscode各种设置  

* 基本设置  
  1.在`File`->`Perferences`->`Settings`中搜索`Render Whitespace`,在下拉框中选择`all`,把空白字符都渲染出来,方便查看代码  
  ![设置](../images/tools/4.png)  
  2.安装`indent-rainbow`插件,缩进自动彩色，大大提高编程效率  
  3.安装`Rainbow Brackets`插件,括号彩色分组，防止看错括号对  
  
<br/>  
<br/>  

* 设置右键打开VSCode  
  1.创建一个文本文档,将后缀名改为`.reg`,将以下代码复制进去  
  ```
  Windows Registry Editor Version 5.00

  [HKEY_CLASSES_ROOT\*\shell\VSCode]
  @="Open with Code"
  "Icon"="D:\\Program Files\\Microsoft VS Code\\Code.exe"

  [HKEY_CLASSES_ROOT\*\shell\VSCode\command]
  @="\"D:\\Program Files\\Microsoft VS Code\\Code.exe\" \"%1\""

  Windows Registry Editor Version 5.00

  [HKEY_CLASSES_ROOT\Directory\shell\VSCode]
  @="Open with Code"
  "Icon"="D:\\Program Files\\Microsoft VS Code\\Code.exe"

  [HKEY_CLASSES_ROOT\Directory\shell\VSCode\command]
  @="\"D:\\Program Files\\Microsoft VS Code\\Code.exe\" \"%V\""

  Windows Registry Editor Version 5.00

  [HKEY_CLASSES_ROOT\Directory\Background\shell\VSCode]
  @="Open with Code"
  "Icon"="D:\\Program Files\\Microsoft VS Code\\Code.exe"

  [HKEY_CLASSES_ROOT\Directory\Background\shell\VSCode\command]
  @="\"D:\\Program Files\\Microsoft VS Code\\Code.exe\" \"%V\""
  ```  
  里面的目录换成你电脑上VSCode安装的目录  
  2.保存文档,双击运行,点继续.右键就`Open with Code`选项了  
<br/>  
<br/>  

* 设置调试html设置  
  1.VSCode 上装一个插件：`Debugger for Chrome`  
  2.按F5，打开`launch.json`  
  3.插入以下配置  
  ```json
    {
            "name": "使用本机 Chrome 调试",
            "type": "chrome",
            "request": "launch",
            "file": "${workspaceRoot}/index.html",
            // "url": "http://mysite.com/index.html", 
            //使用外部服务器时,请注释掉 file, 改用 url, 并将 useBuildInServer 设置为 false
            "runtimeExecutable": "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe", // 改成您的 Chrome 安装路径
            "sourceMaps": true,
            "webRoot": "${workspaceRoot}",
            // "preLaunchTask":"build",
            "userDataDir":"${tmpdir}",
            "port":5433
    }
  ```  
  4.在调试栏下选择`使用本机 Chrome 调试`  
  ![调试](../images/tools/1.png "可选标题")  
  5.按F5就可以调试了  
     
<br/>  
<br/>  

* markdown设置  
  1.安装`Markdown All in One`插件  
  2.安装`Markdown Preview Github Styling`插件  
  3.点击图片上的按钮  
  ![预览按钮](../images/tools/2.png)  
  4.实时预览  
  ![预览](../images/tools/3.png)  
  
<br/>  
<br/>  

* lua设置  
  1.安装`Lua Language Server coded by Lua`插件  
  2.安装`Luacheck`插件  
  3.在`settings.json`中插入以下配置  
  ```json
    "Lua.diagnostics.severity" : {
      "redefined-local" : "Hint",
      "emmy-lua" : "Hint",
      "undefined-global": "Hint",   //隐藏未定义的全局变量提示
      "lowercase-global": "Hint",
    }
  ```  
  4.在根目录下创建`.luacheckrc`文件,在文件中插入以下代码  
  ```lua
    std = {
      globals = {
        "ClassicCombos",    -- 隐藏未定义的全局变量提示
      }
    }
    max_line_length = 255   -- 单行最大字数
  ```
  
<br/>  
<br/>  

[返回](../home.md)