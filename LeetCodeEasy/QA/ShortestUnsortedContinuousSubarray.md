# [最短无序连续子数组](https://leetcode-cn.com/problems/shortest-unsorted-continuous-subarray)

### 问题

给定一个整数数组，你需要寻找一个连续的子数组，如果对这个子数组进行升序排序，那么整个数组都会变为升序排序。

你找到的子数组应是最短的，请输出它的长度。

示例 1:

```
输入: [2, 6, 4, 8, 10, 9, 15]
输出: 5
解释: 你只需要对 [6, 4, 8, 10, 9] 进行升序排序，那么整个表都会变为升序排序。
```
说明 :

* 输入的数组长度范围在 [1, 10,000]。
* 输入的数组可能包含重复元素 ，所以升序的意思是<=。

### 解答

```
/**
 * @param {number[]} nums
 * @return {number}
 */
// 此数组左右两边都是排序好的

写法一：
var findUnsortedSubarray = function(nums) {
    const copy = [...nums].sort((a, b) => a - b);
    let sortedCnt = 0, i = 0, j = nums.length - 1;
    while ((nums[i] === copy[i]) && (i <= j)) {
        sortedCnt += 1;
        i += 1;
    }
    while ((i <= j) && (nums[j] === copy[j])) {
        sortedCnt += 1;
        j -= 1;
    }
    return nums.length - sortedCnt;
};

写法二：
var findUnsortedSubarray = function(nums) {
    let max = nums[0],  min = nums[nums.length -1];
    let end = -1, start = 0;
    for (let index = 0; index < nums.length; index += 1) {
        max = Math.max(max, nums[index]);
        min = Math.min(min, nums[nums.length - 1 - index]);
        if(nums[index] < max) { end = index; }
        if(nums[nums.length - 1 - index] > min) {
            start = nums.length - 1 - index;
        }
    }
    return  end - start + 1;
};

写法三：
var findUnsortedSubarray = function(nums) {
    let sortedCnt = 0, i = 0, flag = true;
    for (; i < nums.length; i += 1) {
        for (let j = i + 1; j < nums.length; j += 1) {
            if (nums[i] > nums[j]) { flag = false; break; }
        }
        if (flag) { sortedCnt += 1; } else { break; }
    }
    for (let j = nums.length - 1; j > i; j -= 1) {
        for (let k = j - 1; k >= i; k -= 1) {
            if (nums[j] < nums[k]) return nums.length - sortedCnt;
        }
        sortedCnt += 1;
    }
    return nums.length - sortedCnt;
};
```