# [按奇偶排序数组](https://leetcode-cn.com/problems/sort-array-by-parity)

### 问题

给定一个非负整数数组 A，返回一个由 A 的所有偶数元素组成的数组，后面跟 A 的所有奇数元素。

你可以返回满足此条件的任何数组作为答案。



示例：

```
输入：[3,1,2,4]
输出：[2,4,3,1]
输出 [4,2,3,1]，[2,4,1,3] 和 [4,2,1,3] 也会被接受。
```


提示：

* 1 <= A.length <= 5000
* 0 <= A[i] <= 5000

### 解答

```
/**
 * @param {number[]} A
 * @return {number[]}
 */
 解法一：
// 空间复杂度为1
var sortArrayByParity = function(A) {
    let i = 0, j = A.length - 1, temp
    while (i < j) {
        if ((A[i] % 2) && !(A[j] % 2)) {
            temp = A[j]
            A[j] = A[i]
            A[i] = temp
        } else {
            if (!(A[i] % 2)) i += 1
            if (A[j] % 2) j -= 1
        }
    }
    return A
};

解法二：
// 空间复杂度n
var sortArrayByParity = function(A) {
    const res = []
    let i = 0, j = A.length - 1
    for (let k = 0; k < A.length; k += 1) {
        if (A[k] % 2) {
            res[j] = A[k]
            j -= 1
        } else {
            res[i] = A[k]
            i += 1
        }
    }
    return res
}
```
