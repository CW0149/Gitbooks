# [山脉数组的峰顶索引](https://leetcode-cn.com/problems/peak-index-in-a-mountain-array)

### 问题



### 解答

```
/**
 * @param {number[]} A
 * @return {number}
 */
 解法一：
// 二分搜索法
var peakIndexInMountainArray = function(A) {
    let i = 1, j = A.length - 2, mid
    while (i <= j) {
        mid = ~~((i + j) / 2)
        if (A[mid] > A[mid + 1] && A[mid] > A[mid - 1]) {
            return mid
        } else if (A[mid] < A[mid - 1]) {
            j = mid - 1
        } else {
            i = mid + 1
        }
    }
};

解法二：
var peakIndexInMountainArray = function(A) {
    let i = 1
    while (A[i] > A[i - 1]) i += 1
    return i - 1
};
```