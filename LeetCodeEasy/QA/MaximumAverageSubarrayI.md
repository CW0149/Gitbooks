# [子数组最大平均数 I](https://leetcode-cn.com/problems/maximum-average-subarray-i)

### 问题

给定 n 个整数，找出平均数最大且长度为 k 的连续子数组，并输出该最大平均数。

示例 1:

```
输入: [1,12,-5,-6,50,3], k = 4
输出: 12.75
解释: 最大平均数 (12-5-6+50)/4 = 51/4 = 12.75
```


注意:

* 1 <= k <= n <= 30,000。
* 所给数据范围 [-10,000，10,000]。

### 解答

```
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
// 先求出前k个数平均数，然后一步一步向后移动, 更新最大平均数
var findMaxAverage = function(nums, k) {
    let kSum = maxSum = 0
    for (let i = 0; i < k; i += 1) {
        kSum += nums[i]
    }
    maxSum = kSum
    for (let i = k; i < nums.length; i += 1) {
        kSum += nums[i] - nums[i - k]
        if (kSum > maxSum) maxSum = kSum
    }
    return maxSum / k
};
```
