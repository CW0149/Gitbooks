# [最小移动次数使数组元素相等](https://leetcode-cn.com/problems/minimum-moves-to-equal-array-elements)

### 问题

给定一个长度为 n 的非空整数数组，找到让数组所有元素相等的最小移动次数。每次移动可以使 n - 1 个元素增加 1。

示例:

```
输入:
[1,2,3]

输出:
3

解释:
只需要3次移动（注意每次移动会增加两个元素的值）：

[1,2,3]  =>  [2,3,3]  =>  [3,4,3]  =>  [4,4,4]
```

### 解答

```
/**
 * @param {number[]} nums
 * @return {number}
 */
// 反向解释：每次可使一个元素减1，总数-最小元素*n
var minMoves = function(nums) {
    var min = Infinity, sum = 0;
    for (var i = 0; i < nums.length; i += 1) {
        if (nums[i] < min) {
            min = nums[i];
        }
        sum += nums[i];
    }
    return sum - min * nums.length;
};
```