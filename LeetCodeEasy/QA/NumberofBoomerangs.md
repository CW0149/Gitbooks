# [回旋镖的数量](https://leetcode-cn.com/problems/number-of-boomerangs)

### 问题

给定平面上 n 对不同的点，“回旋镖” 是由点表示的元组 (i, j, k) ，其中 i 和 j 之间的距离和 i 和 k 之间的距离相等（需要考虑元组的顺序）。

找到所有回旋镖的数量。你可以假设 n 最大为 500，所有点的坐标在闭区间 [-10000, 10000] 中。

示例:

```
输入:
[[0,0],[1,0],[2,0]]

输出:
2

解释:
两个回旋镖为 [[1,0],[0,0],[2,0]] 和 [[1,0],[2,0],[0,0]]
```

### 解答

```
/**
 * @param {number[][]} points
 * @return {number}
 */
解法一：
var numberOfBoomerangs = function(points) {
    var mp = {}, tags = [];
    for (var i = 0; i < points.length; i += 1) {
        for (var j = 0; j < points.length; j += 1) {
            var key = String(points[i]);
            mp[key] = mp[key] || {};
            var d2 = (points[j][0] - points[i][0]) ** 2 + (points[j][1] - points[i][1]) ** 2;
            mp[key][d2] = mp[key][d2] || [];
            mp[key][d2].push(String(points[j]));
            if (mp[key][d2].length === 2) {
                tags.push({ key: key, d2: d2 });
            }
        }
    }
    var res = [];
    tags.forEach(function(tag) {
       var eles = mp[tag.key][tag.d2];
       for (var i = 0; i < eles.length; i += 1) {
           for (var j = 0; j < eles.length; j += 1) {
               if (eles[i] !== eles[j]) {
                   res.push([Array(tag.key), Array(eles[i]), Array(eles[j])]);
               }
           }
       }
    });
    return res.length;
};

解法二：
var numberOfBoomerangs = function(points) {
    var res = 0;
    for (var i = 0; i < points.length; i++) {
        var mp = {};
        for (var j = 0; j < points.length; j++) {
            if (j != i) {
                var dist = (points[j][0] - points[i][0]) ** 2 + (points[j][1] - points[i][1]) ** 2;
                mp[dist] = (mp[dist] || 0) + 1;
            }
        }
        Object.keys(mp).forEach(function(key) {
            var value = mp[key];
            if (value >= 2) {
                res += value * (value - 1);
            }
        })
    }
    return res;
};
```