# [最大三角形面积](https://leetcode-cn.com/problems/largest-triangle-area)

### 问题

给定包含多个点的集合，从其中取三个点组成三角形，返回能组成的最大三角形的面积。

示例:
```
输入: points = [[0,0],[0,1],[1,0],[0,2],[2,0]]
输出: 2
解释:
这五个点如下图所示。组成的橙色三角形是最大的，面积为2。
```

<img src="https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/04/1027.png" width="200">

注意:

3 <= points.length <= 50.
不存在重复的点。
 -50 <= points[i][j] <= 50.
结果误差值在 10^-6 以内都认为是正确答案。

### 解答

```
/**
 * @param {number[][]} points
 * @return {number}
 */
 <!-- 向量积差 -->
var largestTriangleArea = function(points) {
    let max = 0
    for (let i = 0; i < points.length - 2; i += 1) {
        for (let j = i + 1; j < points.length - 1; j += 1) {
            const x1 = points[j][0] - points[i][0], y1 = points[j][1] - points[i][1]
            for (let k = j + 1; k < points.length; k += 1) {
                const x2 = points[k][0] - points[i][0], y2 = points[k][1] - points[i][1]
                max = Math.max(max, Math.abs(x1 * y2 - x2 * y1))
            }
        }
    }
    return max / 2
};
```
