# [打家劫舍](https://leetcode-cn.com/problems/house-robber)

### 问题

你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。

示例 1:

```
输入: [1,2,3,1]
输出: 4
```
解释: 偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
     偷窃到的最高金额 = 1 + 3 = 4 。
示例 2:

```
输入: [2,7,9,3,1]
输出: 12
```
解释: 偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
     偷窃到的最高金额 = 2 + 9 + 1 = 12 。


### 解答

```
/**
 * @param {number[]} nums
 * @return {number}
 */
// Boolean(-1) === true
解法一：
var rob = function(nums) {
    if (!nums.length) return 0;
    var dp = [0, nums[0]];
    for (var i = 1; i < nums.length; i += 1) {
        dp[i + 1] = Math.max(nums[i] + dp[i - 1], dp[i]);
    }
    return dp[nums.length];
}

解法二：
var rob = function(nums, cache, start) {
    if (!nums.length) return 0;
    if (nums.length === 1) return nums[0];
    if (nums.length === 2) return Math.max.apply(null, nums);
    cache = cache || {}; start = start > 0 ? start : 0;
    var result = [], k1, k2;
    for (var i = 0; i < nums.length; i += 1) {
        if (nums[i] === 0) { result[i] = -1;  continue; }
        k1 = start + ',' + (start + i - 2);
        k2 = (start + i + 2) + ',' + (start + nums.length - 1);
        cache[k1] = cache[k1] || rob(nums.slice(0, i -1 <= 0 ? 0 : i - 1), cache, start);
        cache[k2] = cache[k2] || rob(nums.slice(i + 2), cache, start + i + 2)
        result[i] = nums[i] + Math.max(cache[k1], cache[k2]);
    }
    return Math.max.apply(null, result);
};
```