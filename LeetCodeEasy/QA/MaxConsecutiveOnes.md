# [最大连续1的个数](https://leetcode-cn.com/problems/max-consecutive-ones)

### 问题

给定一个二进制数组， 计算其中最大连续1的个数。

示例 1:

```
输入: [1,1,0,1,1,1]
输出: 3
解释: 开头的两位和最后的三位都是连续1，所以最大连续1的个数是 3.
```
注意：

* 输入的数组只包含 0 和1。
* 输入数组的长度是正整数，且不超过 10,000。

### 解答

```
/**
 * @param {number[]} nums
 * @return {number}
 */
var findMaxConsecutiveOnes = function(nums) {
    var max_count = c = 0;
    for (var i = 0; i < nums.length; i += 1) {
        c = nums[i] ? c + 1 : 0;
        max_count = max_count < c ? c : max_count;
    }
    return max_count || c;
};
```