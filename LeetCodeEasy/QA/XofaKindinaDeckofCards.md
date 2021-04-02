# [卡牌分组](https://leetcode-cn.com/problems/x-of-a-kind-in-a-deck-of-cards)

### 问题

给定一副牌，每张牌上都写着一个整数。

此时，你需要选定一个数字 X，使我们可以将整副牌按下述规则分成 1 组或更多组：

每组都有 X 张牌。
组内所有的牌上都写着相同的整数。
仅当你可选的 X >= 2 时返回 true。



示例 1：

```
输入：[1,2,3,4,4,3,2,1]
输出：true
解释：可行的分组是 [1,1]，[2,2]，[3,3]，[4,4]
```
示例 2：

```
输入：[1,1,1,2,2,2,3,3]
输出：false
解释：没有满足要求的分组。
```
示例 3：

```
输入：[1]
输出：false
解释：没有满足要求的分组。
```
示例 4：

```
输入：[1,1]
输出：true
解释：可行的分组是 [1,1]
```
示例 5：

```
输入：[1,1,2,2,2,2]
输出：true
解释：可行的分组是 [1,1]，[2,2]，[2,2]
```

提示：

* 1 <= deck.length <= 10000
* 0 <= deck[i] < 10000


### 解答

```
/**
 * @param {number[]} deck
 * @return {boolean}
 */
// 转为求相同卡牌个数最大公约数，若小于2则返回-1
// 求最大公约数是否大于1，从大到小遍历
var hasGroupsSizeX = function(deck) {
    const mp = {}
    for (let d of deck) {
        mp[d] = (mp[d] || 0) + 1
    }
    const arr = []
    let max = -Infinity
    Object.keys(mp).forEach(num => {
        max = max < mp[num] ? mp[num] : max
        arr.push(mp[num])
    })

    for (let i = max; i >= 2; i -= 1) {
        let j = 0
        for (; j < arr.length; j += 1) {
            if (arr[j] % i) break
        }
        if (j === arr.length) return true
    }
    return false
};
```
