# [合并两个有序链表](https://leetcode-cn.com/problems/merge-two-sorted-lists)

### 问题

将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

示例：

```
输入：1->2->4, 1->3->4
输出：1->1->2->3->4->4
```

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
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var mergeTwoLists = function(l1, l2) {
    var n1 = l1, n2 = l2, result = node = {};
    while (n1 && n2) {
        if (n1.val <= n2.val) {
            node.next = { val: n1.val, next: null }
            n1 = n1.next;
        } else {
            node.next = { val: n2.val, next: null }
            n2= n2.next;
        }
        node = node.next;
    }
    node.next = n1 || n2;
    return result.next;
};
```

