# [复原IP地址](https://leetcode-cn.com/problems/restore-ip-addresses)

### 问题

给定一个只包含数字的字符串，复原它并返回所有可能的 IP 地址格式。

示例:

```
输入: "25525511135"
输出: ["255.255.11.135", "255.255.111.35"]
```

### 解答

```
/**
 * @param {string} s
 * @return {string[]}
 */

function getResult(s, c, o, result) {
    if (!s && c) { return false; }
    if (c === 1) {
        if (check(s)) {
            return result.push(o + '.' + s);
        }
        return false;
    }
    for (var i = 1; i <= 3; i += 1) {
        var str = s.slice(0, i);
        if (!check(str)) continue;
        getResult(s.slice(i), c - 1, o ? o + '.' +  str : str, result);
    }
}

function check(s) {
    return (s.length <= 3) && (Number(s) <= 255) && !((s.length > 1 ) && (s[0] === '0'));
}

var restoreIpAddresses = function(s) {
    var result = [];
    if (s.length < 4 || s.length > 12) return [];

    getResult(s, 4, '', result);

    return result;
};
```