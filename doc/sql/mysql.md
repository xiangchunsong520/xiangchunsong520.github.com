# mysql  
## 安装  
[ubuntu安装](https://blog.csdn.net/weixx3/article/details/80782479)  

1. 安装mysql-server  
`sudo apt-get update` # 更新软件源  
`sudo apt-get install mysql-server`  #安装  
`mysql --version` #查看版本  

2. 设置root密码  
`sudo mysql -u root` #使用root无密码登录  
`alter user 'root'@'localhost' identified with mysql_native_password by '123456';` #设置密码  
`flush privileges;` #刷新权限  
`exit` #退出


3. 配置远程登录  
`mysql -u root -p`  
`use mysql;`  
`update user set host = '%' where user = 'root';`  
`flush privileges;`  
`exit` #退出

4. 允许其它IP远程登录
vim 打开 `/etc/mysql/mysql.conf.d/mysqld.cnf`  
修改`bind-address = 0.0.0.0`

5. 重启mysql
`sudo systemctl restart mysql`


## 卸载  
`sudo apt-get remove mysql-server`  
`sudo apt-get autoremove`  
`sudo apt-get autoclean`  

## 配置防火墙
`sudo ufw allow mysql`
`sudo ufw enable`
`sudo ufw status`