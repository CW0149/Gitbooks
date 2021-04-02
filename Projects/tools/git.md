# Git

## 修改 git config

git 通过查看 git config 来自动设置 git 操作过程中的信息，包括 email、username 等信息。有几种层级的 git config : local、global、system。

使用 `git config --list` 可以查看 config 信息。里面第一行可以看到如 `credential.helper=osxkeychain`，

`git init` 初始化一个文件夹后，会生成一个 `.git` 隐藏文件夹，其中 config 文件包含了 git push 等操作过程中带的 name、email、远程分支路径等信息，这个 config 文件 就是 `local` 层级的。可以通过进入文件夹，然后 `git config user.email "email"` 来设置信息。 也可以通过 `git config --global/local/system user.emal "email"` 分别设置 global/local/system 下的 git config.


如果你使用 git config 设置 user.email 不生效，原因及解决方法如下：

1. credential 里面保存了你之前的用户信息，需要删除保存的 credential。Mac 下打开钥匙串访问，界面选择全部，然后搜索 git ，删除对应的钥匙信息。
2. 在修改 git config 前使用 git init 初始化了文件夹并 commit 过一次，虽然 git config --local 会重新 .git 文件夹里面的 config ， 但是 logs 文件夹里面还有文件可能带有以前的 emial 信息，导致 git push 可能报邮件不匹配的错误。这时可以删除 .git 文件夹重新 init ，或者全局搜索 .git 文件夹里面的以前 user 信息，并修改成当前（未测试）。