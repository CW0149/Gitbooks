# [下一个更大元素 III](https://leetcode-cn.com/problems/next-greater-element-iii)

### 问题

给定一个32位正整数 n，你需要找到最小的32位整数，其与 n 中存在的位数完全相同，并且其值大于n。如果不存在这样的32位整数，则返回-1。

示例 1:

```
输入: 12
输出: 21
```
示例 2:

```
输入: 21
输出: -1
```

### 解答

```
/**
 * @param {number} n
 * @return {number}
 */
function swap(arr, i, j) {
    var temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}
var nextGreaterElement = function(n) {
    if (n <= 10) return -1;
    var s = String(n).split(''), i = s.length - 1;
    while (i--) {
        for (var j = s.length - 1; j > i; j -= 1) {
            if (s[i] < s[j])  {
                swap(s, i, j);
                var num = Number(s.slice(0, i + 1).concat(s.slice(i + 1).reverse()).join(''));
                return  num <= 0x7fffffff ? num : -1;
                break;
            }
        }
    }
    return -1;
};
```