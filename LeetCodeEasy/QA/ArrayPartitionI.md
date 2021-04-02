# [数组拆分 I](https://leetcode-cn.com/problems/array-partition-i)

### 问题

给定长度为 2n 的数组, 你的任务是将这些数分成 n 对, 例如 (a1, b1), (a2, b2), ..., (an, bn) ，使得从1 到 n 的 min(ai, bi) 总和最大。

示例 1:

```
输入: [1,4,3,2]

输出: 4
解释: n 等于 2, 最大总和为 4 = min(1, 2) + min(3, 4).
```
提示:

* n 是正整数,范围在 [1, 10000].
* 数组中的元素范围在 [-10000, 10000].

### 解答

```
/**
 * @param {number[]} nums
 * @return {number}
 */
// 考虑对半分，其中一个min是数组的最小值，另一个要最大则应该是第n+1大的
// 依此类推，转为数组排序问题-第偶数大的值相加
var arrayPairSum = function(nums) {
    nums.sort(function(a, b) { return a - b });
    var sum = 0;
    nums.forEach(function(num, index) {
        if (index % 2 === 0) {
            sum += nums[index];
        }
    });
    return sum;
};
```