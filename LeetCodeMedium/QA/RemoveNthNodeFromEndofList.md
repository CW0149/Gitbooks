# [删除链表的倒数第N个节点](https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list)

### 问题

给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

示例：

```
给定一个链表: 1->2->3->4->5, 和 n = 2.

当删除了倒数第二个节点后，链表变为 1->2->3->5.
```
说明：

给定的 n 保证是有效的。

进阶：

你能尝试使用一趟扫描实现吗？

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
 * @param {number} n
 * @return {ListNode}
 */
// 遍历节点存储到数组，索引到n然后删除
var removeNthFromEnd = function(head, n) {
    const nodes = []
    let node = head
    while (node) {
        nodes.push(node)
        node = node.next
    }

    const delIndex = nodes.length - n
    if (delIndex === 0) {
        return nodes[1] || null
    } else {
        nodes[delIndex - 1].next = nodes[delIndex].next
        return head
    }
};
```

