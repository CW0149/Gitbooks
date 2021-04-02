# [简化路径](https://leetcode-cn.com/problems/simplify-path)

### 问题

给定一个文档 (Unix-style) 的完全路径，请进行路径简化。

例如，<br>
path = "/home/", => "/home"<br>
path = "/a/./b/../../c/", => "/c"

边界情况:

* 你是否考虑了 路径 = "/../" 的情况？
在这种情况下，你需返回 "/" 。
* 此外，路径中也可能包含多个斜杠 '/' ，如 "/home//foo/" 。
在这种情况下，你可忽略多余的斜杠，返回 "/home/foo" 。

### 解答

```
/**
 * @param {string} path
 * @return {string}
 */
var simplifyPath = function(path) {
    var handledArr = path.split('/').filter(function(item) {return item});
    let stack = [];
    for (let i = 0; i < handledArr.length; i += 1) {
        var name = handledArr[i];
        switch (name) {
            case '..':
                stack.pop();
                break;
            case '.':
                break;
            default:
                stack.push(name);
        }
    }
    return '/' + stack.join('/');
};
```

