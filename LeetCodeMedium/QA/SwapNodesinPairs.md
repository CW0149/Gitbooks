# [两两交换链表中的节点](https://leetcode-cn.com/problems/swap-nodes-in-pairs)

### 问题

给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。

你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。



示例:

```
给定 1->2->3->4, 你应该返回 2->1->4->3.
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
 * @param {ListNode} head
 * @return {ListNode}
 */
// 节点地址的变更
var swapPairs = function(head) {
    if (!head || !head.next) return head;
    let n1 = head, n2 = n1.next, s1 = n2.next;
    n2.next = n1, n1.next = swapPairs(s1);
    return n2;
};
```

