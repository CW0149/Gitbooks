# [词典中最长的单词](https://leetcode-cn.com/problems/longest-word-in-dictionary)

### 问题

给出一个字符串数组words组成的一本英语词典。从中找出最长的一个单词，该单词是由words词典中其他单词逐步添加一个字母组成。若其中有多个可行的答案，则返回答案中字典序最小的单词。

若无答案，则返回空字符串。

示例 1:

```
输入:
words = ["w","wo","wor","worl", "world"]
输出: "world"
解释:
单词"world"可由"w", "wo", "wor", 和 "worl"添加一个字母组成。
```
示例 2:

```
输入:
words = ["a", "banana", "app", "appl", "ap", "apply", "apple"]
输出: "apple"
解释:
"apply"和"apple"都能由词典中的单词组成。但是"apple"得字典序小于"apply"。
```
注意:

* 所有输入的字符串都只包含小写字母。
* words数组长度范围为[1,1000]。
* words[i]的长度范围为[1,30]。


### 解答

```
/**
 * @param {string[]} words
 * @return {string}
 */
// 先将数组元素按照字符串长度归类
// 从最长字符串开始遍历

var longestWord = function(words) {
    const cate = []
    for (let word of words) {
        cate[word.length - 1] = cate[word.length - 1] || {}
        cate[word.length - 1][word] = true
    }
    const res = []
    for (let i = cate.length - 1; i >= 0; i -= 1) {
        if (!cate[i]) continue
        const lWords = Object.keys(cate[i])
        for (let j = 0; j < lWords.length; j += 1) {
            let word = lWords[j], k = i - 1
            for (; k >= 0; k -= 1) {
                word = word.slice(0, -1)
                if (!cate[k] || !cate[k][word]) break
            }
            if (k === -1) res.push(lWords[j])
        }
        if (res.length) break
    }
    return res.sort()[0] || ''
};
```
