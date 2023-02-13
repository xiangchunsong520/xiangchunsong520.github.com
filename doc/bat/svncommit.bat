@echo off
cd Windows
for /f "usebackq tokens=1*" %%i in (`svn st ^| findstr !`) do svn rm "%%j"
for /f "usebackq tokens=1*" %%i in (`svn st ^| findstr ?`) do svn add "%%j"
svn commit -m "commit"
pause