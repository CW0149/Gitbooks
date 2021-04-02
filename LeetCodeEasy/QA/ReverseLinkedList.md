# [反转链表](https://leetcode-cn.com/problems/reverse-linked-list)

### 问题

反转一个单链表。

示例:

```
输入: 1->2->3->4->5->NULL
输出: 5->4->3->2->1->NULL
```
进阶:
你可以迭代或递归地反转链表。你能否用两种方法解决这道题？

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
 * @return {ListNode}
 */

解法一：
var reverseList = function(head) {
    if (!head || !head.next) return head;
    var lastNode = new ListNode(head.val), curNode;
    var node = head.next;
    while (node) {
        curNode = new ListNode(node.val);
        curNode.next = lastNode;
        lastNode = curNode;
        node = node.next;
    }
    return curNode;
};

解法二：
var reverseList = function(head) {
    if (!head || !head.next) return head;
    var stack = [], node = head, left;
    while (node) {
        left = node.next;
        node.next = null;
        stack.push(node);
        node = left;
    }
    for (var i = stack.length -1; i >= 0; i -= 1) {
        stack[i].next = stack[i - 1] || null;
    }
    return stack.pop();
};

解法三：
var reverseList = function(head) {
    if (!head || !head.next) return head;
    var before = head, cur, left = head.next;
    head.next = null;
    while (left) {
        cur = left;
        left = cur.next;
        cur.next = before;
        before = cur;
    }
    return cur;
}

解法四：
var reverseList = function(head) {
    if (!head || !head.next) return head;
    var leftList = reverseList(head.next);
    var last = leftList;
    while (last.next) {
        last = last.next;
    }
    head.next = null;
    last.next = head;
    return leftList;
}

解法五：
function reverse(head) {
    if (!head || !head.next) return {
        head: head,
        last: head
    };
    var leftList = reverse(head.next);
    head.next = null;
    leftList.last.next = head;
    return {
        head: leftList.head,
        last: head
    }
}
var reverseList = function(head) {
    return reverse(head).head;
}
```