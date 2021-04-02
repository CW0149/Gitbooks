# [旋转数组](https://leetcode-cn.com/problems/rotate-array)

### 问题

给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。

示例 1:

```
输入: [1,2,3,4,5,6,7] 和 k = 3
输出: [5,6,7,1,2,3,4]
解释:
向右旋转 1 步: [7,1,2,3,4,5,6]
向右旋转 2 步: [6,7,1,2,3,4,5]
向右旋转 3 步: [5,6,7,1,2,3,4]
```
示例 2:

```
输入: [-1,-100,3,99] 和 k = 2
输出: [3,99,-1,-100]
解释:
向右旋转 1 步: [99,-1,-100,3]
向右旋转 2 步: [3,99,-1,-100]
```
说明:

* 尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
* 要求使用空间复杂度为 O(1) 的原地算法。


### 解答

```
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {void} Do not return anything, modify nums in-place instead.
 */

解法一：
var rotate = function(nums, k) {
    if (nums.length <= 1) return nums;
    k %= nums.length;
    while (k--) {
        var index = nums.length - 1;
        var temp = nums[index];
        while (index--) {
            nums[index + 1] = nums[index];
        }
        nums[0] = temp;
    }
    return nums;
};

解法二：
// 一步到位移动。先将最末尾数存起来，留下一个空位，然后不断向前数k位补全空缺。
// nums中元素移动了nums.length后则停止操作(k可能为nums.length的公约数);
function round(emptyIndex, nums, k, maxMoveTimes) {
    var temp = nums[emptyIndex], lastIndex = (emptyIndex + k) % nums.length, nextEmptyIndex;
    while (emptyIndex !== lastIndex) {
        nextEmptyIndex = (emptyIndex - k + nums.length) % nums.length;
        nums[emptyIndex] = nums[nextEmptyIndex];
        emptyIndex = nextEmptyIndex;
        maxMoveTimes -= 1;
    }
    nums[lastIndex] = temp;
    maxMoveTimes -= 1;
    if (maxMoveTimes) {
        round(emptyIndex - 1, nums, k, maxMoveTimes);
    }
}

var rotate = function(nums, k) {
    if (nums.length <= 1) return nums;
    k %= nums.length;
    if (!k) return nums;
    var emptyIndex = nums.length - 1, maxMoveTimes = nums.length;
    round(emptyIndex, nums, k, maxMoveTimes);
    return nums;
}
```

