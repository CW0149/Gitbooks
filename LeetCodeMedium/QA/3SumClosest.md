# [最接近的三数之和](https://leetcode-cn.com/problems/3sum-closest)

### 问题

给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。

```
例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.

与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
```


### 解答

```
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
// 暴力法
var threeSumClosest = function(nums, target) {
    let res = [], closet = Infinity
    for (let i = 0; i < nums.length - 2; i += 1) {
        for (let j = i + 1; j < nums.length - 1; j += 1) {
            for (let k = j + 1; k < nums.length; k += 1) {
                const sum = nums[i] + nums[j] + nums[k]
                const diff =  Math.abs(sum - target)
                if (diff === 0) {
                    return sum
                } else if (closet > diff) {
                    closet = diff
                    res = sum
                }
            }
        }
    }
    return res
};
```

