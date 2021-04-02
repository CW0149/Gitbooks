# [模拟行走机器人](https://leetcode-cn.com/problems/walking-robot-simulation)

### 问题*

机器人在一个无限大小的网格上行走，从点 (0, 0) 处开始出发，面向北方。该机器人可以接收以下三种类型的命令：

-2：向左转 90 度
-1：向右转 90 度
1 <= x <= 9：向前移动 x 个单位长度
在网格上有一些格子被视为障碍物。

第 i 个障碍物位于网格点  (obstacles[i][0], obstacles[i][1])

如果机器人试图走到障碍物上方，那么它将停留在障碍物的前一个网格方块上，但仍然可以继续该路线的其余部分。

返回从原点到机器人的最大欧式距离的平方。



示例 1：

```
输入: commands = [4,-1,3], obstacles = []
输出: 25
解释: 机器人将会到达 (3, 4)
```
示例 2：

```
输入: commands = [4,-1,4,-2,4], obstacles = [[2,4]]
输出: 65
解释: 机器人在左转走到 (1, 8) 之前将被困在 (1, 4) 处
```


提示：

* 0 <= commands.length <= 10000
* 0 <= obstacles.length <= 10000
* -30000 <= obstacle[i][0] <= 30000
* -30000 <= obstacle[i][1] <= 30000
* 答案保证小于 2 ^ 31


### 解答

```
/**
 * @param {number[]} commands
 * @param {number[][]} obstacles
 * @return {number}
 */
// 两个变量记录机器人目前坐标
// 一个变量记录当前方向，共四种状态 0 1 2 3
// 分别对应北 东 南 西
var robotSim = function(commands, obstacles) {
    let x = y = 0, dir = 0, max = 0
    const set = new Set(obstacles.map(ob => String(ob)))

    const dx = [0, 1, 0, -1]
    const dy = [1, 0, -1, 0]
    for (let command of commands) {
        switch (command) {
            case -1:
                dir = (dir + 5) % 4
                break
            case -2:
                dir = (dir + 3) % 4
                break
            default:
                for (let step = 1; step <= command; step += 1) {
                    let nx = x + dx[dir], ny = y + dy[dir]
                    if (set.has(String([nx, ny]))) break
                    x = nx, y = ny
                }
        }
        max = Math.max(max, x ** 2 + y ** 2 )
    }
    return max
};
```
