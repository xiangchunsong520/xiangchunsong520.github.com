# Go代码仓库代理设置  

在国内有个时候用`go get -u github.com/xxx`命令时没有速度  
如果Go 版本是 1.13 及以上  
```
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.io,direct
```  

如果Go 版本是 1.12 及以下  
```
# 启用 Go Modules 功能
export GO111MODULE=on
# 配置 GOPROXY 环境变量
export GOPROXY=https://goproxy.io
```  

[返回](../home.md)