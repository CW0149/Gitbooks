# [最大子序和](https://leetcode-cn.com/problems/maximum-subarray)

### 问题

给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

示例:

```
输入: [-2,1,-3,4,-1,2,1,-5,4],
输出: 6
解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
```
进阶:

如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。

### 解答

```
/**
 * @param {number[]} nums
 * @return {number}
 */
var maxSubArray = function(nums) {
    if (!nums.length) return 0;
    var sums = [nums[0]], max = nums[0];
    for (var i = 1; i < nums.length; i += 1) {
        if (sums[i - 1] > 0) {
            sums[i] = sums[i - 1] + nums[i];
        } else {
            sums[i] = nums[i];
        }
        max = sums[i] > max ? sums[i] : max;
    }
    return max;
};
```

