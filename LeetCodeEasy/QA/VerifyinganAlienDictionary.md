# [验证外星语词典](https://leetcode-cn.com/problems/verifying-an-alien-dictionary)

### 问题

某种外星语也使用英文小写字母，但可能顺序 order 不同。字母表的顺序（order）是一些小写字母的排列。

给定一组用外星语书写的单词 words，以及其字母表的顺序 order，只有当给定的单词在这种外星语中按字典序排列时，返回 true；否则，返回 false。



示例 1：

```
输入：words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
输出：true
解释：在该语言的字母表中，'h' 位于 'l' 之前，所以单词序列是按字典序排列的。
```
示例 2：

```
输入：words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
输出：false
解释：在该语言的字母表中，'d' 位于 'l' 之后，那么 words[0] > words[1]，因此单词序列不是按字典序排列的。
```
示例 3：

```
输入：words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
输出：false
解释：当前三个字符 "app" 匹配时，第二个字符串相对短一些，然后根据词典编纂规则 "apple" > "app"，因为 'l' > '∅'，其中 '∅' 是空白字符，定义为比任何其他字符都小（更多信息）。
```


提示：

* 1 <= words.length <= 100
* 1 <= words[i].length <= 20
* order.length == 26
* 在 words[i] 和 order 中的所有字符都是英文小写字母。

### 解答

```
/**
 * @param {string[]} words
 * @param {string} order
 * @return {boolean}
 */
// 两个变量分别指示word和字典的位置
// 一个变量用来指示首字母相同的单词字符位置
function compareTwo(w1, w2, order) {
    let i = 0
    while (w2[i] && w1[i]) {
        if (w2[i] === w1[i]) {
            i += 1
        } else {
            if (order.indexOf(w2[i]) < order.indexOf(w1[i])) return false
            break
        }
    }
    if (i === w2.length && w1.length > i) return false
    return true
}
var isAlienSorted = function(words, order) {
    let j = -1
    for (let i  = 0; i < words.length; i += 1) {
        const word = words[i]
        if (order[j] === word[0] && !compareTwo(words[i - 1], word, order)) return false
        while (order[j] !== word[0]) {
            j += 1
            if (!order[j]) return false
        }
    }
    return true
};
```
