# [合并区间](https://leetcode-cn.com/problems/merge-intervals)

### 问题

给出一个区间的集合，请合并所有重叠的区间。

示例 1:

```
输入: [[1,3],[2,6],[8,10],[15,18]]
输出: [[1,6],[8,10],[15,18]]
解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
```
示例 2:

```
输入: [[1,4],[4,5]]
输出: [[1,5]]
解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。
```


### 解答

```
/**
 * Definition for an interval.
 * function Interval(start, end) {
 *     this.start = start;
 *     this.end = end;
 * }
 */
/**
 * @param {Interval[]} intervals
 * @return {Interval[]}
 */
var merge = function(intervals) {
    if (intervals.length <= 1) return intervals;
    var result = [];
    var sorted = [].concat(intervals).sort(function(a, b) {
       return a.start < b.start ? -1 : Number(a.start > b.start);
    });
    for (var i = 1; i < sorted.length; i += 1) {
        if (sorted[i - 1].end >= sorted[i].start) {
            sorted[i].start = sorted[i - 1].start;
            sorted[i].end = sorted[i].end > sorted[i - 1].end ? sorted[i].end : sorted[i - 1].end;
            sorted[i - 1] = null;
        } else {
            result.push(sorted[i - 1]);
        }
    }
    result.push(sorted[sorted.length - 1]);
    return result;
};
```

