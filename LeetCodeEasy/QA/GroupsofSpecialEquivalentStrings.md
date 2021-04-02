# [特殊等价字符串组](https://leetcode-cn.com/problems/groups-of-special-equivalent-strings)

### 问题

你将得到一个字符串数组 A。

如果经过任意次数的移动，S == T，那么两个字符串 S 和 T 是特殊等价的。



一次移动包括选择两个索引 i 和 j，且 i％2 == j％2，并且交换 S[j] 和 S [i]。

现在规定，A 中的特殊等价字符串组是 A 的非空子集 S，这样不在 S 中的任何字符串与 S 中的任何字符串都不是特殊等价的。



返回 A 中特殊等价字符串组的数量。



示例 1：
```
输入：["a","b","c","a","c","c"]
输出：3
解释：3 组 ["a","a"]，["b"]，["c","c","c"]```
示例 2：
```
输入：["aa","bb","ab","ba"]
输出：4
解释：4 组 ["aa"]，["bb"]，["ab"]，["ba"]```
示例 3：
```
输入：["abc","acb","bac","bca","cab","cba"]
输出：3
解释：3 组 ["abc","cba"]，["acb","bca"]，["bac","cab"]
```
示例 4：

```
输入：["abcd","cdab","adcb","cbad"]
输出：1
解释：1 组 ["abcd","cdab","adcb","cbad"]
```


提示：

* 1 <= A.length <= 1000
* 1 <= A[i].length <= 20
* 所有 A[i] 都具有相同的长度。
* 所有 A[i] 都只由小写字母组成。

### 解答

```
/**
 * @param {string[]} A
 * @return {number}
 */
// 转为将字符串按照特殊等价进行归类
// 判断字符串特殊等价：字符串中奇/偶索引指示的字符拥有相同的字符及个数
// 遍历字符串组，如果属于特殊等价集合加入等价组，否则创建等价组
var numSpecialEquivGroups = function(A) {
    const set = new Set()
    for (let str of A) {
        const a1 = [], a0 = []
        let flag = true
        for (let c of str) {
            const index = c.charCodeAt() - 97
            flag ? a0[index] = (a0[index] || 0) + 1 : a1[index] = (a1[index] || 0) + 1
            flag = !flag
        }
        let id = '', a = a0.concat(a1)
        a.forEach((c, index) => (c && (id += '' + index + c)))
        set.add(id)
    }
    return set.size
};
```
