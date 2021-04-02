# [反转字符串](https://leetcode-cn.com/problems/reverse-string)

### 问题

编写一个函数，其作用是将输入的字符串反转过来。

示例 1:

```
输入: "hello"
输出: "olleh"
```
示例 2:

```
输入: "A man, a plan, a canal: Panama"
输出: "amanaP :lanac a ,nalp a ,nam A"
```

### 解答

```
/**
 * @param {string} s
 * @return {string}
 */
var reverseString = function(s) {
    return s.split('').reverse().join('');
};
```