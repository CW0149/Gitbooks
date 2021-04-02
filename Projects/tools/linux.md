# Linux 操作

## 本机 IP 地址

使用 hostname -I 可以查看本机 IP 地址。

你可能遇到这种情况：

你启用了一个如 3000 端口可以返回网页信息，但是浏览器打开 [ip]:3000 却显示拒绝访问，[ip] 能够 ping 通，127.0.0.1:3000 也能访问。这时候可以使用 `netstat -lnpt` 查看系统端口监听状态。若 3000 端口对应的是 ip 为特定的 127.0.0.1 则意味着只有通过这个 ip 才能访问这个端口。这时可以将 127.0.0.1 改成 如 0.0.0.0 的广播形式。

## Linux 软件安装

对于较复杂的 Linux 软件，使用如 tar -xzf 解压后，在根目录可能看到 `autogen.sh`、`.configure.ac` 等文件，这时候需先运行 `./autogen.sh` 生成 `.configure` 文件，然后运行如 `./configure && make && sudo make install`。

