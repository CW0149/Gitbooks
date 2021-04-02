# [四数之和](https://leetcode-cn.com/problems/4sum)

### 问题

给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。

注意：

答案中不可以包含重复的四元组。

示例：

```
给定数组 nums = [1, 0, -1, 0, -2, 2]，和 target = 0。

满足要求的四元组集合为：
[
  [-1,  0, 0, 1],
  [-2, -1, 1, 2],
  [-2,  0, 0, 2]
]
```

### 解答

```
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[][]}
 */
var twoSum = function(nums, target) {
    var i = 0, j = nums.length - 1, result = [];
    while (i < j) {
        var sum = nums[i] + nums[j];
        if (sum === target) {
            result.push([nums[i], nums[j]]);
            i++; j--;
        }
        if (sum > target) j--;
        if (sum < target) i++;
        while (i < j && nums[i] === nums[i - 1]) i++;
        while(i < j && nums[j] === nums[j + 1]) j--;
    }
    return result;
}

var numberSum = function(nums, target, number) {
    var result = [];
    for (var i = 0; i <= nums.length - number; i += 1) {
        if (nums[i] === nums[i - 1]) continue;
        var subTarget = target - nums[i];
        var fn = number -1 === 2 ? twoSum : numberSum;
        var subResult = fn(nums.slice(i + 1), subTarget, number - 1);
        subResult.forEach(function(item) {
           result.push(item.concat([nums[i]]));
        });
    }
    return result;
}
var fourSum = function(nums, target) {
    var sortedArr = nums.sort(function(a, b) {
        return a < b ? -1 : Boolean(a > b);
    });

    return numberSum(nums, target, 4);
};
```

