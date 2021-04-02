# [括号生成](https://leetcode-cn.com/problems/generate-parentheses)

### 问题

给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。

例如，给出 n = 3，生成结果为：

```
[
  "((()))",
  "(()())",
  "(())()",
  "()(())",
  "()()()"
]
```


### 解答

```
/**
 * @param {number}
 * @return {string[]}
 */
// 左右两个篮子，若左右篮子物体相等取左边篮子，否则随便取，左篮必定小于右篮
const generateParenthesis = function(n) {
    if (n < 1) return [];

    return getResult(n, n);
};

const getResult = (m, n) => {
    if (m === 0) {
        let s = '';
        while (n--) {
            s += ')';
        }
        return [s];
    } else if (m === n) {
        return getResult(m - 1, n).map(item => `(${item}`);
    } else {
        return getResult(m - 1, n).map(item => `(${item}`).concat(getResult(m, n - 1).map(item => `)${item}`));
    }
};
```

