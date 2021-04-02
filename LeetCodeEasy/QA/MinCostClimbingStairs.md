# [使用最小花费爬楼梯](https://leetcode-cn.com/problems/min-cost-climbing-stairs)

### 问题

数组的每个索引做为一个阶梯，第 i个阶梯对应着一个非负数的体力花费值 cost[i](索引从0开始)。

每当你爬上一个阶梯你都要花费对应的体力花费值，然后你可以选择继续爬一个阶梯或者爬两个阶梯。

您需要找到达到楼层顶部的最低花费。在开始时，你可以选择从索引为 0 或 1 的元素作为初始阶梯。

示例 1:

```
输入: cost = [10, 15, 20]
输出: 15
解释: 最低花费是从cost[1]开始，然后走两步即可到阶梯顶，一共花费15。
```
示例 2:

```
输入: cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
输出: 6
解释: 最低花费方式是从cost[0]开始，逐个经过那些1，跳过cost[3]，一共花费6。
```
注意：

* cost 的长度将会在 [2, 1000]。
* 每一个 cost[i] 将会是一个Integer类型，范围为 [0, 999]。

### 解答

```
/**
 * @param {number[]} cost
 * @return {number}
 */
/**
 * @param {number[]} cost
 * @return {number}
 */
 解法一：
// 转为求数组中不相邻数字和的最大值，使用贪心算法
// 结果为数组总和-上述值
// 遍历数组，两个变量分别记录数组和和当前元素为数组尾的不相邻最大值数组
// 要节省空间，可以使用包含三个元素的数组记录不相邻最大值
var minCostClimbingStairs = function(cost) {
    let sum = cost[0] + cost[1], arr = [cost[0], Math.max(cost[0], cost[1])]
    for (let i = 2; i < cost.length; i += 1) {
        sum += cost[i]
        arr[i] = Math.max(arr[i - 1], arr[i - 2] + cost[i])
    }
    return sum - arr[arr.length - 1]
};


解法二：
// 贪心算法花费体力最小值
// 数组最后两个分别为经过最后一个阶梯最小值和不经过最后一个阶梯最小值
var minCostClimbingStairs = function(cost) {
    const arr = [cost[0], cost[1]]
    for (let i = 2; i < cost.length; i += 1) {
        arr[i] = cost[i] + Math.min(arr[i - 2], arr[i - 1])
    }
    return Math.min(arr[arr.length - 1], arr[arr.length - 2])
};
```