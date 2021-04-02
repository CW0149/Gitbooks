# [第三大的数](https://leetcode-cn.com/problems/third-maximum-number)

### 问题

给定一个非空数组，返回此数组中第三大的数。如果不存在，则返回数组中最大的数。要求算法时间复杂度必须是O(n)。

示例 1:

```
输入: [3, 2, 1]

输出: 1

解释: 第三大的数是 1.
```
示例 2:

```
输入: [1, 2]

输出: 2

解释: 第三大的数不存在, 所以返回最大的数 2 .
```
示例 3:

```
输入: [2, 2, 3, 1]

输出: 1

解释: 注意，要求返回第三大的数，是指第三大且唯一出现的数。
存在两个值为2的数，它们都排第二。
```

### 解答

```
/**
 * @param {number[]} nums
 * @return {number}
 */
 <!-- 想象一个漏斗 -->
var thirdMax = function(nums) {
    var b1, b2, b3;
    for (var i = 0; i < nums.length; i += 1) {
        if (!(nums[i] <= b1)) { // 漏下小于或等于b1的数
            b3 = b2; b2 = b1;
            b1 = nums[i];
        } else if (!(nums[i] <= b2) && (nums[i] !== b1)) {
            b3 = b2;
            b2 = nums[i];
        } else if (!(nums[i] <= b3) && (nums[i] !== b2) && (nums[i] !== b1)) {
            b3 = nums[i];
        }
    }
    return isNaN(b3) ? b1 : b3;
};
```