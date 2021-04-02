# [机器人能否返回原点](https://leetcode-cn.com/problems/robot-return-to-origin)

### 问题

L（左），U（上）和 D（下）。如果机器人在完成所有动作后返回原点，则返回 true。否则，返回 false。

注意：机器人“面朝”的方向无关紧要。 “R” 将始终使机器人向右移动一次，“L” 将始终向左移动等。此外，假设每次移动机器人的移动幅度相同。



示例 1:

```
输入: "UD"
输出: true
解释：机器人向上移动一次，然后向下移动一次。所有动作都具有相同的幅度，因此它最终回到它开始的原点。因此，我们返回 true。
```
示例 2:

```
输入: "LL"
输出: false
解释：机器人向左移动两次。它最终位于原点的左侧，距原点有两次 “移动” 的距离。我们返回 false，因为它在移动结束时没有返回原点。
```

### 解答

```
/**
 * @param {string} moves
 * @return {boolean}
 */
// 能回到原处则L、R，U、D的个数分别相等
var judgeCircle = function(moves) {
    const moveVal = { L: 0, R: 0, U: 0, D: 0 }
    for (let move of moves) {
        moveVal[move] += 1
    }
    return (moveVal.L === moveVal.R) && (moveVal.U === moveVal.D)
};
```
