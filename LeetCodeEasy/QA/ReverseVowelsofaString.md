# [反转字符串中的元音字母](https://leetcode-cn.com/problems/reverse-vowels-of-a-string)

### 问题


编写一个函数，以字符串作为输入，反转该字符串中的元音字母。

示例 1:

```
输入: "hello"
输出: "holle"
```
示例 2:

```
输入: "leetcode"
输出: "leotcede"
```
说明:
元音字母不包含字母"y"。

### 解答

```
/**
 * @param {string} s
 * @return {string}
 */

解法一：
var reverseVowels = function(s) {
    var vowels = { a: 1, A: 1, e: 1, E: 1,  i: 1, I: 1, o: 1, O: 1, u: 1, U: 1 };
    var arr = s.split('');
    var i = 0; j = s.length - 1;
    while (i < j) {
        var a = arr[i], b = arr[j];
        if (!vowels[a]) i += 1;
        if (!vowels[b]) j -= 1;
        if (vowels[a] && vowels[b]) {
            arr[j--] = a; arr[i++] = b;
        }
    }
    return arr.join('');
};

解法二：
var reverseVowels = function(s) {
    var vowels = { a: 1, A: 1, e: 1, E: 1,  i: 1, I: 1, o: 1, O: 1, u: 1, U: 1 };
    var arr = s.split(''), stack = [], i =  -1;
    while (++i < arr.length) {
        if (vowels[arr[i]]) {
            stack.push(arr[i]);
            arr[i] = undefined;
        }
    }
    i = - 1;
    while (++i < arr.length) {
        if (!arr[i]) arr[i] = stack.pop();
    }
    return arr.join('');
};
```