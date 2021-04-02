# [猜数字大小](https://leetcode-cn.com/problems/guess-number-higher-or-lower)

### 问题

我们正在玩一个猜数字游戏。 游戏规则如下：
我从 1 到 n 选择一个数字。 你需要猜我选择了哪个数字。
每次你猜错了，我会告诉你这个数字是大了还是小了。
你调用一个预先定义好的接口 guess(int num)，它会返回 3 个可能的结果（-1，1 或 0）：

```
-1 : 实际数字比它小
 1 : 实际数字比它大
 0 : 恭喜！你猜对了！
 ```
示例 :

```
输入: n = 10, pick = 6
输出: 6
```

### 解答

```
# The guess API is already defined for you.
# @param num, your guess
# @return -1 if my number is lower, 1 if my number is higher, otherwise return 0
# def guess(num):

class Solution(object):
    def guessNumber(self, n):
        """
        :type n: int
        :rtype: int
        """
        left = 0
        right = n
        while left <= right:
            mid = int((left + right) / 2)
            result = guess(mid)
            if result == 0:
                return mid
            if result == 1:
                left = mid + 1
                continue
            if result == -1:
                right = mid - 1
        return -1
```

### Tips
* [搜索插入位置](SearchInsertPosition.md)
* [x 的平方根](Sqrtx.md)