# [最长连续递增序列](https://leetcode-cn.com/problems/longest-continuous-increasing-subsequence)

### 问题

给定一个未经排序的整数数组，找到最长且连续的的递增序列。

示例 1:

```
输入: [1,3,5,4,7]
输出: 3
解释: 最长连续递增序列是 [1,3,5], 长度为3。
尽管 [1,3,5,7] 也是升序的子序列, 但它不是连续的，因为5和7在原数组里被4隔开。
```
示例 2:

```
输入: [2,2,2,2,2]
输出: 1
解释: 最长连续递增序列是 [2], 长度为1。
```
注意：数组长度不会超过10000。

### 解答

```
/**
 * @param {number[]} nums
 * @return {number}
 */
// 就像岛屿，连续递增一定是连接的，所以复杂度为n

写法一：
var findLengthOfLCIS = function(nums) {
    if (nums.length < 2) return nums.length
    let maxCnt = cnt = 1
    for (let i = 1; i < nums.length; i += 1) {
        if (nums[i] <= nums[i - 1]) {
            maxCnt = cnt > maxCnt ? cnt : maxCnt
            cnt = 1
        } else {
            cnt += 1
        }
    }
    return cnt > maxCnt ? cnt : maxCnt
};

写法二：
var findLengthOfLCIS = function(nums) {
    var start = end = 0, max = 0;
    while (end < nums.length) {
        while (nums[end + 1] > nums[end]) end += 1;
        var count = end - start + 1;
        max =  max - count > 0 ? max : count;
        end = start = end + 1;
    }
    return max;
};
```
