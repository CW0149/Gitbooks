# [求众数](https://leetcode-cn.com/problems/majority-element)

### 问题

给定一个大小为 n 的数组，找到其中的众数。众数是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。

你可以假设数组是非空的，并且给定的数组总是存在众数。

示例 1:

```
输入: [3,2,3]
输出: 3
```
示例 2:

```
输入: [2,2,1,1,1,2,2]
输出: 2
```

### 解答

```
/**
 * @param {number[]} nums
 * @return {number}
 */

解法一：
var majorityElement = function(nums) {
    var minTimes = Math.ceil(nums.length / 2), map = {};
    for (var i = 0; i < nums.length; i += 1) {
        map[nums[i]] = map[nums[i]] ? map[nums[i]] + 1 : 1;
        if (map[nums[i]] >= minTimes) return nums[i];
    }
};

解法二：
var majorityElement = function(nums) {
    var result, left = 0;
    for (var i = 0; i < nums.length; i += 1) {
        if (left === 0) result = nums[i];
        left = nums[i] === result ? left + 1 : left - 1;
    }
    return result;
};
```