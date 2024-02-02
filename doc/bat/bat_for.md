# bat脚本学习  
  
## [bat 批处理 for 命令快速入门](https://www.jb51.net/article/134025.htm)  
这篇文章主要介绍了bat 批处理 for 命令快速入门,需要的朋友可以参考下  
<br/>
格式：`FOR [参数] %%变量名 IN (相关文件或命令) DO 执行的命令`  
作用：对一个或一组文件，字符串或命令结果中的每一个对象执行特定命令，达到我们想要的结果。  
注意：在批处理文件中使用 `FOR` 命令时，指定变量请使用 `%%variable`,而不要用 `%variable`。变量名称是区分大小写的，所以 `%i` 不同于 `%I`.  
关于：for命令可以带参数或不带参数，带参数时支持以下参数:`/d /l /r /f`  
下面分别解释一下  

* 零：无参数时:  
    `FOR %variable IN (set) DO command [command-parameters]`  
    `%variable` 指定一个单一字母可替换的参数。  
    `(set)` 指定一个或一组文件。可以使用通配符。  
    `command` 指定对每个文件执行的命令。  
    `command-parameters` 为特定命令指定参数或命令行开关。  
    
    TTT示例：  
    ```bat
    for %%i in (t*.*) do echo %%i --显示当前目录下与t*.*相匹配的文件(只显示文件名，不显示路径)
    for %%i in (d:\mydocuments\*.doc) do @echo %%i --显示d:\mydocuments\目录下与*.doc相匹配的文件
    ```
    <br/>  
* 一、参数 /d (参数只能显示当前目录下的目录名字)  
    格式：`FOR /D %variable IN (set) DO command [command-parameters]`  
    这个参数主要用于目录搜索,不会搜索文件,/D 参数只能显示当前目录下的目录名字。(TTT特别说明：只会搜索指定目录下的目录，不会搜索再下一级的目录。)  
    
    TTT示例：  
    ```bat
    for /d %%i in (c:\*) do echo %%i --显示c盘根目录下的所有目录
    for /d %%i in (???) do echo %%i --显示当前目录下名字只有1-3个字母的目录
    ```
    <br/>  
* 二、参数 /R (搜索指定路径及所有子目录中与set相符合的所有文件)  
    格式：`FOR /R [[drive:]path] %variable IN (set) DO command [command-parameters]`  
    此命令会搜索指定路径及所有子目录中与set相符合的所有文件，注意是指定路径及所有子目录。  
    1、set中的文件名如果含有通配符(？或*)，则列举/R参数指定的目录及其下面的所用子目录中与set相符合的所有文件，无相符文件的目录则不列举。  
    2、如果set中为具体文件名，不含通配符，则枚举该目录树（即列举该目录及其下面的所有子目录）(并在后面加上具体的文件名)，而不管set中的指定文件是否存在。  
    例：  
    ```bat
    for /r c:\ %%i in (*.exe) do echo %%i --把C盘根目录,和每个目录的子目录下面全部的EXE文件都列出来了!!!!
    ```
    TTT示例： 
    ```bat
    for /r c:\ %%i in (boot.ini) do echo %%i --枚举了c盘所有目录
    for /r d:\backup %%i in (1) do echo %%i --枚举d\backup目录
    for /r c:\ %%i in (boot.ini) do if exist %%i echo %%i --很好的搜索命令，列举boot.ini存在的目录
    ```
    <br/>  
* 三、参数 /L (该集表示以增量形式从开始到结束的一个数字序列。可以使用负的 Step)  
    格式：`FOR /L %variable IN (start,step,end) DO command [command-parameters]`  
    该集表示以增量形式从开始到结束的一个数字序列。可以使用负的 Step  
    
    TTT示例：  
    ```bat
    for /l %%i in (1,1,5) do @echo %%i --输出1 2 3 4 5
    for /l %%i in (1,2,10) do @echo %%i --输出1,3，5,7，9
    for /l %%i in (100,-20,1) do @echo %%i --输出100,80,60,40,20
    for /l %%i in (1,1,5) do start cmd --打开5个CMD窗口
    for /l %%i in (1,1,5) do md %%i --建立从1~5共5个文件夹
    for /l %%i in (1,1,5) do rd /q %%i --删除从1~5共5个文件夹
    ```
    <br/>

* 四、参数 /F (使用文件解析来处理命令输出、字符串及文件内容。)  
    这个参数是最难的，参数又多，先简单的解释一下：for命令带这个参数可以分析文件内容，字符串内容或某一命令输出的结果，并通过设置option得我们想要的结果。  
    
    以下是某高手的解释，感觉有点太专业了，自认为不太容易理解，也列一下：
    [迭代及文件解析--使用文件解析来处理命令输出、字符串及文件内容。使用迭代变量定义要检查的内容或字符串，并使用各种options选项进一步修改解析方式。使用options令牌选项指定哪些令牌应该作为迭代变量传递。

    请注意：在没有使用令牌选项时，/F 将只检查第一个令牌。文件解析过程包括读取输出、字符串或文件内容，将其分成独立的文本行以及再将每行解析成零个或更多个令牌。然后通过设置为令牌的迭代变量值，调用 for 循环。  
    默认情况下，/F 传递每个文件每一行的第一个空白分隔符号。跳过空行。]  

    (TTT补充说明：  
    一般在tokens后只指定第一个参数，如%%i或%%a，在后面使用第二个及两个以上的参数，自动按顺序往下排即可。如前面指定的是%%a，后面则 用%%b代表第二个结果，%%c代表第 三个结果。。。测试了一下tokens后指定多个变量名，没有测试成功，应该是不可以的。所以token后只能跟要使用的第一个变量名  
    如果使用的变量名超过了%z或%Z，就无法使用了，曾经以为会循环过来：如%%z后可以使用%%a或%%A，但经测试，这是不可以的。  
    如：`for /f "tokens=1,2,3* delims=-, " %%y in ("aa bb,cc-dd ee") do echo %%y %%z %%A %%a --只会输出前两个字符串，后面的两个变量是无效的。`)
    
    TTT:下面列我做的几个例子：  
    * 1，分析文件的例子  
        `FOR /F "eol=; tokens=1,2* delims=,- " %%i in (d:\test.txt) do echo %%i %%j %%k`  
    * 2，分析字符串的例子：  
        `for /f "tokens=1,2,3* delims=-, " %%i in ("aa bb,cc-dd ee") do echo %%i %%j %%k %%l`  
    * 3，分析命令输出的例子：  
        `FOR /F "tokens=1* delims==" %%i IN ('set') DO @echo [%%i----%%j]`  

    如果使用了`usebackq`参数后，命令如下，结果与上面的完全相同。  
    * 1，分析文件的例子  
        `FOR /F "usebackq eol=; tokens=1,2* delims=,- " %%i in ("d:\test.txt") do echo  %%i %%j %%k`  
    * 2，分析字符串的例子：  
        `for /f "usebackq tokens=1,2,3* delims=-, " %%i in ('aa bb,cc-dd ee') do echo %%i %%j %%k %%l`  
    * 3，分析命令输出的例子：(会枚举当前环境中的环境变量名称和值。)
        `FOR /F "usebackq tokens=1* delims==" %%i IN (`set`) DO @echo [%%i----%%j]`  
    结果大家可以试一下，很容易就明白的。  
    <br>  

下面依次说明一下：  
* 一、 ~I - 删除任何引号(")，扩展 %I  
    这个变量的作用就如他的说明,删除引号!  
    删除引号规则如下(BAT兄补充!)：  
    * 1、若字符串首尾同时存在引号，则删除首尾的引号；  
    * 2、若字符串尾不存在引号，则删除字符串首的引号；  
    * 3、如果字符串中间存在引号，或者只在尾部存在引号，则不删除。  
    龙卷风补充：无头不删，有头连尾删。  

    我们来看这个例子，首先建立临时文件temp.txt，内容如下  
    ```txt
    "1111
    "2222"
    3333"
    "4444"44
    "55"55"55
    ```  
    也可建立个BAT文件代码如下:
    ```bat
    @echo off
    echo ^"1111>temp.txt
    echo "2222">>temp.txt
    echo 3333^">>temp.txt
    echo "4444"44>>temp.txt
    echo ^"55"55"55>>temp.txt
    rem 上面建立临时文件，注意不成对的引号要加转义字符^，重定向符号前不要留空格
    FOR /F "delims=" %%i IN (temp.txt) DO echo %%~i
    pause
    del temp.txt
    ```
    执行后,我们看CMD的回显如下:  
    ```
    1111 #字符串前的引号被删除了  
    2222 #字符串首尾的引号都被删除了  
    3333" #字符串前无引号，后面的引号保留  
    4444"44 #字符串前面的引号删除了，而中间的引号保留  
    55"55"55 #字符串前面的引号删除了，而中间的引号保留  
    请按任意键继续. . .  
    ```
    结果和之前temp.txt中的内容对比一下,我们会发现第1、2、5行的引号都消失了,这就是删除引号~i的作用了!  
    <br/>
* 二、 %~fI - 将 %I 扩展到一个完全合格的路径名  
    示例:  
    把代码保存放在随便哪个地方,我这里就放桌面吧.  
    ```bat
    FOR /F "delims==" %%i IN ('dir /b') DO @echo %%~fi
    pause
    ```
    执行后显示内容如下
    ```
    C:\Documents and Settings\Administrator\桌面\test.bat
    C:\Documents and Settings\Administrator\桌面\test.vbs
    ```
    当我把代码中的 %%~fi直接改成%%i  
    ```bat
    FOR /F "delims==" %%i IN ('dir /b') DO @echo %%i
    pause
    ```
    执行后就会显示以下内容：  
    ```
    test.bat
    test.vbs
    ```
    通过对比,我们很容易就看出没有路径了,这就是"将 %I 扩展到一个完全合格的路径名"的作用，也就是如果%i变量的内容是一个文件名的话,他就会把这个文件所在的绝对路径打印出来,而不只单单打印一个文件名,自己动手动实验下就知道了!  
    <br>
* 三、 %~dI - 仅将 %I 扩展到一个驱动器号  
    看例子:  
    代码如下,我还是放到桌面执行!  
    ```bat
    FOR /F "delims==" %%i IN ('dir /b') DO @echo %%~di
    pause
    ```
    执行后我CMD里显示如下  
    ```
    C:
    C:
    ```
    我桌面就两个文件test.bat,test.vbs,%%~di作用是,如果变量%%i的内容是一个文件或者目录名,他就会把他这文件或者目录所在的盘符号打印出来!  
    <br>
* 四、 %~pI - 仅将 %I 扩展到一个路径  
    这个用法和上面一样,他只打印路径不打印文件名字  
    ```bat
    FOR /F "delims==" %%i IN ('dir /b') DO @echo %%~pi
    pause
    ```
    我就不打结果了,大家自己复制代码看结果吧,下面几个都是这么个用法,代码给出来,大家自己看结果吧!  
    <br>
* 五、 %~nI - 仅将 %I 扩展到一个文件名  
    只打印文件名字
    ```bat
    FOR /F "delims==" %%i IN ('dir /b') DO @echo %%~ni
    pause
    ```
    <br>
* 六、 %~xI - 仅将 %I 扩展到一个文件扩展名  
    只打印文件的扩展名  
    ```bat
    FOR /F "delims==" %%i IN ('dir /b') DO @echo %%~xi
    pause
    ```
    <br>
* 七、 %~sI - 扩展的路径只含有短名  
    打印绝对短文件名
    ```bat
    FOR /F "delims==" %%i IN ('dir /b') DO @echo %%~si
    pause
    ```
    <br>
* 八、 %~aI - 将 %I 扩展到文件的文件属性  
    打印文件的属性
    ```bat
    FOR /F "delims==" %%i IN ('dir /b') DO @echo %%~ai
    pause
    ```
    <br>
* 九、 %~tI - 将 %I 扩展到文件的日期/时间  
    打印文件建立的日期
    ```bat
    FOR /F "delims==" %%i IN ('dir /b') DO @echo %%~ti
    pause
    ```
    <br>
* 十、 %~zI - 将 %I 扩展到文件的大小  
    打印文件的大小
    ```bat
    FOR /F "delims==" %%i IN ('dir /b') DO @echo %%~zi
    pause
    ```
    龙卷风补充：上面例子中的"delims=="可以改为"delims="，即不要分隔符  
    <br>
* 十一、 %~$PATH:I - 查找列在路径环境变量的目录，并将 %I 扩展到找到的第一个完全合格的名称。如果环境变量名未被定义，或者没有找到文件，此组合键会扩展到空字符串
    这是最后一个,和上面那些都不一样,我单独说说!  
    然后在把这些代码保存为批处理,放在桌面。  
    ```bat
    @echo off
    FOR /F "delims=" %%i IN (“notepad.exe”) DO echo %%~$PATH:i
    pause
    ```
    龙卷风补充：上面代码显示结果为C:\WINDOWS\system32\notepad.exe  
    他的意思就在PATH变量里指定的路径里搜索notepad.exe文件，如果有notepad.exe则会把他所在绝对路径打印出来，没有就打印一个错误！  
    (TTT说明，保存到桌面上，运行显示结果为：系统找不到文件 “notepad.exe”。查看环境变量path中确实有这个路径，不明原因!后来发现了，原来是中文引号的原因。  
    上面的命令应该写成：  
    ```FOR /F "delims=" %%i IN ("notepad.exe") DO echo %%~$PATH:i```  
    )
<br>  
更多参考资料：  
[https://blog.csdn.net/jiangxt211/article/details/45033961]  
[http://bbs.bathome.net/thread-2336-1-1.html]  