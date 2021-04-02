# [盛最多水的容器](https://leetcode-cn.com/problems/container-with-most-water)

### 问题

给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

说明：你不能倾斜容器，且 n 的值至少为 2。

<img src="https://aliyun-lc-upload.oss-cn-hangzhou.aliyuncs.com/aliyun-lc-upload/uploads/2018/07/25/question_11.jpg" width="400">

图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。



示例:

```
输入: [1,8,6,2,5,4,8,3,7]
输出: 49
```

### 解答

```
/**
 * @param {number[]} height
 * @return {number}
 */
// 转为求x差值绝对值和y更小值乘积的最大值
// 解法一：暴力法
var maxArea = function(height) {
    let max = 0
    for (let i = 1; i < height.length; i += 1) {
        for (let j = i + 1; j <= height.length; j += 1) {
            const area = (j - i) * Math.min(height[j - 1], height[i - 1])
            max = Math.max(area, max)
        }
    }
    return max
};

// 解法二：双指针法
// 想象初始时只有左右两边界两个容器，然后逐个在中间添加新容器
var maxArea = function(height) {
    let i = 0, j = height.length - 1, max = 0
    while (i < j) {
        max = Math.max(max, Math.min(height[j], height[i]) * (j - i))
        height[i] < height[j] ? i += 1 : j -= 1
    }
    return max
}

```

