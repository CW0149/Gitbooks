# [二进制手表](https://leetcode-cn.com/problems/binary-watch)

### 问题

二进制手表顶部有 4 个 LED 代表小时（0-11），底部的 6 个 LED 代表分钟（0-59）。

每个 LED 代表一个 0 或 1，最低位在右侧。


<img src="https://upload.wikimedia.org/wikipedia/commons/8/8b/Binary_clock_samui_moon.jpg" width="400" />

例如，上面的二进制手表读取 “3:25”。

给定一个非负整数 n 代表当前 LED 亮着的数量，返回所有可能的时间。

案例:

```
输入: n = 1
返回: ["1:00", "2:00", "4:00", "8:00", "0:01", "0:02", "0:04", "0:08", "0:16", "0:32"]
```
注意事项:

* 输出的顺序没有要求。
* 小时不会以零开头，比如 “01:00” 是不允许的，应为 “1:00”。
* 分钟必须由两位数组成，可能会以零开头，比如 “10:2” 是无效的，应为 “10:02”。


### 解答

```
/**
 * @param {number} num
 * @return {string[]}
 */
解法一：
var readBinaryWatch = function(num) {
    if (num > 8) return [];
    var result = [];
    var hours = [[0], [1, 2, 4, 8], [3, 5, 6, 9, 10], [7, 11]];
    var minus = [
        [0],
        [1, 2, 4, 8, 16, 32],
        [3, 5, 6, 9, 10, 12, 17, 18, 20, 24, 33, 34, 36, 40, 48],
        [7, 11, 19, 35, 13, 21, 37, 25, 41, 49, 14, 22, 38, 26, 42, 50, 28, 44, 52, 56],
        [15, 23, 39, 27, 43, 51, 29, 45, 53, 57, 30, 46, 54, 58],
        [31, 47, 55, 59]
    ];
    for (var i = 0; (i <= 3) && (i <= num); i += 1) {
        if (num - i > 5) continue;
        var hour = hours[i], minu = minus[num - i];
        hour.forEach(function(h) {
            minu.forEach(function(m) {
                result.push(h + ':' + (m < 10 ? '0' + m : m));
            })
        });
    }
    return result;
};

解法二：
/**
 * @param {number} num
 * @return {string[]}
 */
function countOnes() {
    var store = {};
    return function(n) {
        if (!isNaN(store[n])) return store[n];
        var ret = 0, m = n;
        while (m) {
            ret += m & 1;
            m >>= 1;
        }
        store[n] = ret;
        return store[n];
    }
}
var readBinaryWatch = function(num) {
    if (num > 8) return [];
    var result = [];
    var countFn = countOnes();
    for (var i = 0; i < 12; i += 1) {
        for (var j = 0; j < 60; j += 1) {
            if (countFn(i) + countFn(j) === num) {
                result.push(i + ":" + ( j < 10 ? "0" + j : j));
            }
        }
    }
    return result;
};
```
