# [非递减数列](https://leetcode-cn.com/problems/non-decreasing-array)

### 问题

给定一个长度为 n 的整数数组，你的任务是判断在最多改变 1 个元素的情况下，该数组能否变成一个非递减数列。

我们是这样定义一个非递减数列的： 对于数组中所有的 i (1 <= i < n)，满足 array[i] <= array[i + 1]。

示例 1:

```
输入: [4,2,3]
输出: True
解释: 你可以通过把第一个4变成1来使得它成为一个非递减数列。
```
示例 2:

```
输入: [4,2,1]
输出: False
解释: 你不能在只改变一个元素的情况下将其变为非递减数列。
```
说明:  n 的范围为 [1, 10,000]。

### 解答

```
/**
 * @param {number[]} nums
 * @return {boolean}
 */
// 转为判断数组n-1个数是否顺序拍好
// 判读数组是否排序，复杂度最小为n
// 若数字不符合非递减skip掉，只有一次机会
// 进阶：若改成递增或递减数列呢？

function unDecrease(nums, index) {
    for (let i = index + 1; i < nums.length; i += 1) {
        if (nums[i] < nums[i - 1]) return false
    }
    return true
}
var checkPossibility = function(nums) {
    if (nums.length < 2) return true
    for (let i = 1; i < nums.length; i += 1) {
        if (nums[i] < nums[i - 1]) {
            return (
                (!(nums[i] < nums[i - 2]) && unDecrease(nums, i)) // 前一个数太大
                || (!(nums[i + 1] < nums[i - 1]) && unDecrease(nums, i + 1)) // 本身太小
            )
        }
    }
    return true
};
```
