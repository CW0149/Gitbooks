# 正则演示

#### 将sublime-keymap(包含多嵌套多键值对的json文件)转为[这样](sublime3Shortcut.md)格式

```
Cmd+Shift+F打开sublime搜索与替换面板，依次运行下面表达式

// 将每个键值对单独分成一行
("[^"]+": (?:\[[^]]+\]|"[^"]+"|\b\w+\b|{[^}]+})) 替换成 \n$1\n

// 删除key不为keys/command的行
// ^(?!"keys"|"command"|\t+//)： 匹配一个行起始位置，这个位置接续不为"keys"/"command"字符串
^(?!"keys"|"command"|\t+//)[^\n]+\n => 替换成

// 将keys command两键值对合并
"keys": (\[[^]]+\])[\s\n]+"command"([^\n]+) 替换成 * $1$2

// 将注释换成h4标题
^\t+// 替换成 ####

// 将li中间空白行替换成两个<br>标签
"[\s\n]{2}(?=\*) 替换成 "\n<br><br>\n
```