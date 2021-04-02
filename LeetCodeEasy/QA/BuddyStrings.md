# [亲密字符串](https://leetcode-cn.com/problems/buddy-strings)

### 问题

给定两个由小写字母构成的字符串 A 和 B ，只要我们可以通过交换 A 中的两个字母得到与 B 相等的结果，就返回 true ；否则返回 false 。



示例 1：

```
输入： A = "ab", B = "ba"
输出： true
```
示例 2：

```
输入： A = "ab", B = "ab"
输出： false
```
示例 3:

```
输入： A = "aa", B = "aa"
输出： true
```
示例 4：

```
输入： A = "aaaaaaabc", B = "aaaaaaacb"
输出： true
```
示例 5：

```
输入： A = "", B = "aa"
输出： false
```


提示：

* 0 <= A.length <= 20000
* 0 <= B.length <= 20000
* A 和 B 仅由小写字母构成。

### 解答

```
/**
 * @param {string} A
 * @param {string} B
 * @return {boolean}
 */
// 左右指针分别找到不同的字符
// 再加判断A中是否有重复字符
var buddyStrings = function(A, B) {
    if (A.length !== B.length) return false
    let i = 0, j = A.length - 1, flag = false, set = new Set()
    while (i < j) {
        if (set.has(A[i]) || set.has(A[j]) || (A[i] === A[j]))
            flag = true
        set.add(A[i])
        set.add(A[j])
        if (A[i] === B[i]) i += 1
        if (A[j] === B[j]) j -= 1
        if (A[i] !== B[i] && A[j] !== B[j]) {
            if (A[i] !== B[j] || A[j] !== B[i]) return false
            return A.slice(i + 1, j) === B.slice(i + 1, j)
        }
    }
    console.log(flag)
    return flag
};
```
