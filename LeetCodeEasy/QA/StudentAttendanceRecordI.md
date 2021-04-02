# [学生出勤记录 I](https://leetcode-cn.com/problems/student-attendance-record-i)

### 问题

给定一个字符串来代表一个学生的出勤记录，这个记录仅包含以下三个字符：

'A' : Absent，缺勤
'L' : Late，迟到
'P' : Present，到场
如果一个学生的出勤记录中不超过一个'A'(缺勤)并且不超过两个连续的'L'(迟到),那么这个学生会被奖赏。

你需要根据这个学生的出勤记录判断他是否会被奖赏。

示例 1:

```
输入: "PPALLP"
输出: True
```
示例 2:

```
输入: "PPALLL"
输出: False
```

### 解答

```
/**
 * @param {string} s
 * @return {boolean}
 */
解法一：
var checkRecord = function(s) {
    var a = b = 0;
    for (var i = 0; i < s.length; i += 1) {
        switch (s[i]) {
            case 'L':
                b += 1; break;
            case 'A':
                a += 1;
            default:
                b = 0;
        }
        if (a === 2 || b === 3) return false;
    }
    return true;
};

解法二：
var checkRecord = function(s) {
    return !(/(A\w*A|L{2}L+)/).test(s);
};
```