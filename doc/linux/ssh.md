# Ubuntu开启ssh服务
1. 安装OpenSSH服务器：  
`sudo apt-get update`  
`sudo apt-get upgrade`  
`sudo apt-get install openssh-server`  
2. 检查SSH服务状态：  
`sudo systemctl enable ssh`  
`sudo systemctl start ssh`  
`sudo systemctl status ssh`  
3. 设置防火墙：  
`sudo ufw allow ssh`
`sudo ufw enable`
`sudo ufw status`
4. 测试连接：  
`ssh username@ip`
