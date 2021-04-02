# [寻找比目标字母大的最小字母](https://leetcode-cn.com/problems/find-smallest-letter-greater-than-target)

### 问题

给定一个只包含小写字母的有序数组letters 和一个目标字母 target，寻找有序数组里面比目标字母大的最小字母。

数组里字母的顺序是循环的。举个例子，如果目标字母target = 'z' 并且有序数组为 letters = ['a', 'b']，则答案返回 'a'。

示例:

```
输入:
letters = ["c", "f", "j"]
target = "a"
输出: "c"

输入:
letters = ["c", "f", "j"]
target = "c"
输出: "f"

输入:
letters = ["c", "f", "j"]
target = "d"
输出: "f"

输入:
letters = ["c", "f", "j"]
target = "g"
输出: "j"

输入:
letters = ["c", "f", "j"]
target = "j"
输出: "c"

输入:
letters = ["c", "f", "j"]
target = "k"
输出: "c"
```
注:

* letters长度范围在[2, 10000]区间内。
* letters 仅由小写字母组成，最少包含两个不同的字母。
* 目标字母target 是一个小写字母。

### 解答

```
/**
 * @param {character[]} letters
 * @param {character} target
 * @return {character}
 */
// 二分搜索法，边界单独考虑
<!-- 这类题目分块简化 -->
var nextGreatestLetter = function(letters, target) {
    if (target >= letters[letters.length - 1] || target < letters[0]) return letters[0]
    let i = 0, j = letters.length - 1, mid
    while (i < j) {
        mid = ~~((i + j) / 2)
        if (letters[mid] <= target) {
            i = mid + 1
        } else {
            j = mid
        }
    }

    return letters[j]
};
```
