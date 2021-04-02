# 常用命令

### gitbook

* 另起一个端口：gserve --lrport 35288 --port 4001

### yarn

* yarn why babel-core

### npm

* npm adduser
* npm init -y
* npm publish --access=public
* npm version major --  change `package.json version`, add 1 major


* npm config set registry http://registry.npmjs.org/
* npm config set registry https://registry.npm.taobao.org/


### Centos

* 查看80端口占用情况：lsof -i tcp:80
* 列出所有端口：netstat -ntlp
* 查看当前文件夹所有文件大小更新时间信息：ls -lht

#### [添加用户、权限](https://www.cnblogs.com/daizhuacai/archive/2013/01/17/2865132.html)
* 创建用户：useradd –d /usr/Ryan -m Ryan // 创建一个登陆名为Ryan的用户并为其创建一个/usr/Ryan主目录
* 修改当前用户密码：passwd
* 超级用户修改用户密码：passwd username
* 超级用户删除用户：userdel username
* 查看当前用户：w/who
* 查看所有用户：cut -d : -f 1 /etc/passwd
* 查看当前用户名：whoami
* 查看单个用户信息：finger username / id username
* 查看用户登录记录：last-成功记录 / lastb-不成功记录

#### [CentOS安装node.js](https://blog.csdn.net/lu_embedded/article/details/79138650)

>EPEL(Extra Packages for Enterprise Linux)是由Fedora Special Interest Group维护的Enterprise Linux（RHEL、CentOS）中经 常用到的包。

```
sudo yum install epel-release
sudo yum install nodejs
```

#### Centos安装nginx

centos安装nginx分为安装、启动、配置开机启动。

```
安装：sudo yum install -y nginx
启动：sudo systemctl start nginx.service
开机启动：sudo systemctl enable nginx.service
测试nginx配置文件：nginx -t
重载：nginx -s reload
启动：service nginx start
重启：service nginx restart
```

nginx安装信息：

- /usr/share/nginx/html ：网站默认目录
- /etc/nginx/conf.d ：网站配置目录
- /etc/nginx/nginx.conf ：nginx全局配置文件