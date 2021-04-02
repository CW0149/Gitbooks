# [网络延迟时间](https://leetcode-cn.com/problems/network-delay-time)

### 问题*

有 N 个网络节点，标记为 1 到 N。

给定一个列表 times，表示信号经过有向边的传递时间。 times[i] = (u, v, w)，其中 u 是源节点，v 是目标节点， w 是一个信号从源节点传递到目标节点的时间。

现在，我们向当前的节点 K 发送了一个信号。需要多久才能使所有节点都收到信号？如果不能使所有节点收到信号，返回 -1。

注意:

* N 的范围在 [1, 100] 之间。
* K 的范围在 [1, N] 之间。
* times 的长度在 [1, 6000] 之间。
* 所有的边 times[i] = (u, v, w) 都有 1 <= u, v <= N 且 1 <= w <= 100。

### 解答

```
/**
 * @param {number[][]} times
 * @param {number} N
 * @param {number} K
 * @return {number}
 */
var networkDelayTime = function(times, N, K) {
		const visited = [], dis = [], edge = []

    for (let i = 1; i <= N; i += 1) {
        visited[i] = false
        dis[i] = Infinity
        edge[i] = []
    }

    for (let i = 0; i < times.length; i += 1) {
        const u = times[i][0]
        const v = times[i][1]
        const w = times[i][2]

        edge[u][v] = w
        if (u === K) dis[v] = w
    }

    visited[K] = true, dis[K] = 0

    while(true) {
        let next = -1
        for (let i = 1; i <= N; i += 1) {
            if (!visited[i] && ((next === -1 && dis[i] !== Infinity)
            		|| (next !== -1 && dis[i] < dis[next]))
            ) next = i
        }
        if (next === -1) break
        visited[next] = true

        for (let i = 1; i <= N; i += 1) {
            if (!visited[i] && !isNaN(edge[next][i])) {
                dis[i] = Math.min(dis[i], dis[next] + edge[next][i])
            }
        }
    }

    let ans = -Infinity
    for (let i = 1; i <= N; i += 1) {
        if (!visited[i]) {
            return -1
        }
        ans = Math.max(ans, dis[i])
    }

    return ans
}
```
