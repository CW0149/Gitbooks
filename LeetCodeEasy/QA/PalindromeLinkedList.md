# [回文链表](https://leetcode-cn.com/problems/palindrome-linked-list)

### 问题

请判断一个链表是否为回文链表。

示例 1:

```
输入: 1->2
```
输出: false
示例 2:

```
输入: 1->2->2->1
输出: true
```
进阶：
你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？

### 解答

```
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} head
 * @return {boolean}
 */
// str拼接会新生
var isPalindrome = function(head) {
    if (!head || !head.next) return true;
    var node = head;
    while (node.next) {
        node.next.before = node;
        node = node.next;
    }
    var n1 = head, n2 = node;
    while (n1) {
        if (n1.val !== n2.val) return false;
        n1 = n1.next;
        n2 = n2.before;
        if (n2 && n2.next) delete n2.next.before;
    }
    return true;
};
```