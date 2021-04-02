# [最长和谐子序列](https://leetcode-cn.com/problems/longest-harmonious-subsequence)

### 问题

和谐数组是指一个数组里元素的最大值和最小值之间的差别正好是1。

现在，给定一个整数数组，你需要在所有可能的子序列中找到最长的和谐子序列的长度。

示例 1:

```
输入: [1,3,2,2,5,2,3,7]
输出: 5
原因: 最长的和谐数组是：[3,2,2,2,3].
```
说明: 输入的数组长度最大不超过20,000.

### 解答

```
/**
 * @param {number[]} nums
 * @return {number}
 */
// 结果序列的最后一位的前面序列一定在它之前
// 可使用一个map保存每个数字的个数
var findLHS = function(nums) {
    const numTimes = {}
    let maxLen = 0
    for (let num of nums) {
        numTimes[num] = (numTimes[num] || 0) + 1
        maxLen = Math.max(
            maxLen,
            numTimes[num - 1] ? numTimes[num - 1] + numTimes[num] : 0,
            numTimes[num + 1] ? numTimes[num + 1] + numTimes[num] : 0
        )
    }
    return maxLen
};
```