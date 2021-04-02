# [数组的度](https://leetcode-cn.com/problems/degree-of-an-array)

### 问题

给定一个非空且只包含非负数的整数数组 nums, 数组的度的定义是指数组里任一元素出现频数的最大值。

你的任务是找到与 nums 拥有相同大小的度的最短连续子数组，返回其长度。

示例 1:

```
输入: [1, 2, 2, 3, 1]
输出: 2
解释:
输入数组的度是2，因为元素1和2的出现频数最大，均为2.
连续子数组里面拥有相同度的有如下所示:
[1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
最短连续子数组[2, 2]的长度为2，所以返回2.
```
示例 2:

```
输入: [1,2,2,3,1,4,2]
输出: 6
```
注意:

* nums.length 在1到50,000区间范围内。
* nums[i] 是一个在0到49,999范围内的整数。

### 解答

```
/**
 * @param {number[]} nums
 * @return {number}
 */
// 转为寻找定义度的数值的具有最小绝对值差的左边界右边界值
// 遍历数组，定义每个元素存储结构{count:, border:[left, right]}
// 使用两变量分别记录当前最大度数和最大度数下最短长度
var findShortestSubArray = function(nums) {
    const mp = {}
    let maxD = 0, minL = Infinity
    for (let i = 0; i < nums.length;  i += 1) {
        const num = nums[i]
        if (mp[num]) {
            mp[num].count += 1
            mp[num].border[1] = i
        } else {
            mp[num] = { count: 1, border: [i, i] }
        }
        const gap = mp[num].border[1] - mp[num].border[0] + 1
        if (mp[num].count > maxD) {
            maxD = mp[num].count
            minL = gap
        } else if (mp[num].count === maxD && minL > gap) {
            minL = gap
        }
    }
    return minL
};
```