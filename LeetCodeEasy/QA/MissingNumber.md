# [缺失数字](https://leetcode-cn.com/problems/missing-number)

### 问题

给定一个包含 0, 1, 2, ..., n 中 n 个数的序列，找出 0 .. n 中没有出现在序列中的那个数。

示例 1:

```
输入: [3,0,1]
输出: 2
```
示例 2:

```
输入: [9,6,4,2,3,5,7,0,1]
输出: 8
```
说明:
你的算法应具有线性时间复杂度。你能否仅使用额外常数空间来实现?

### 解答

```
/**
 * @param {number[]} nums
 * @return {number}
 */

解法一：
var missingNumber = function(nums) {
    var sum = 0;
    for (var i = 0; i < nums.length; i += 1) {
        sum += nums[i];
    }
    return (1 + nums.length) * nums.length / 2 - sum;
};

解法二：
var missingNumber = function(nums) {
    var len = nums.length;
    var count = 0;

    for (var i = 0; i<=len; i++) {
        count  ^=  i ^ nums[i]
    }

    return count
};
```