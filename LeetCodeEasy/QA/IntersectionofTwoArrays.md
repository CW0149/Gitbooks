# [两个数组的交集](https://leetcode-cn.com/problems/intersection-of-two-arrays)

### 问题

给定两个数组，编写一个函数来计算它们的交集。

示例 1:

```
输入: nums1 = [1,2,2,1], nums2 = [2,2]
输出: [2]
```
示例 2:

```
输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
输出: [9,4]
```
说明:

* 输出结果中的每个元素一定是唯一的。
* 我们可以不考虑输出结果的顺序。

### 解答

```
/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number[]}
 */
var intersection = function(nums1, nums2) {
    var result = [], map = {};
    for (var i = 0; i < nums1.length; i += 1) {
        map[nums1[i]] = true;
    }
    for (i = 0; i < nums2.length; i += 1) {
        var num = nums2[i];
        if (map[num]) {
            result.push(num);
            delete map[num];
        }
    }
    return result;
};
```