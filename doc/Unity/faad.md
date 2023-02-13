# 编译faad2 64位遇到的问题 lfintf重定义  
解决方法:  
在```common.h```的316行将代码改从  
```
    #if defined(_WIN32) && !defined(__MINGW32__)
```  
改为
```
    #if defined(_WIN32) && !defined(_WIN64) && !defined(__MINGW32__)
```