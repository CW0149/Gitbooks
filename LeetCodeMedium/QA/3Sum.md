# [三数之和](https://leetcode-cn.com/problems/3sum)

### 问题
给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。

注意：答案中不可以包含重复的三元组。

```
例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，

满足要求的三元组集合为：
[
  [-1, 0, 1],
  [-1, -1, 2]
]
```

### 解答

```
/**
 * @param {number[]} nums
 * @return {number[][]}
 */

function threeSum(nums) {
    if (nums.length < 3) return [];
    var sortedArr = nums.sort(function(a, b) {
        return a < b ? -1 : Boolean(a > b);
    });
    var result = [];
    for(var index = 0; index < sortedArr.length && sortedArr[index] <= 0; index += 1) {
        if (sortedArr[index] === sortedArr[index - 1]) continue;
        var sum = -sortedArr[index], ele = sortedArr[index];
        var i = index + 1, j = sortedArr.length - 1;
        while(i < j) {
            if(sortedArr[i] + sortedArr[j] === sum) {
                result.push([ ele, sortedArr[i], sortedArr[j] ]);
                while( i < j && sortedArr[i] === sortedArr[i+1]) i++;
                while( i < j && sortedArr[j] === sortedArr[j+1]) j--;
                i++;
                j--;
            }
            while(sortedArr[i] + sortedArr[j] < sum) i++;
            while(sortedArr[i] + sortedArr[j] > sum) j--;
        }
    }

    return result;
}
```