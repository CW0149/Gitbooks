# [删除排序链表中的重复元素](https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list)

### 问题

给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。

示例 1:

```
输入: 1->1->2
输出: 1->2
```
示例 2:

```
输入: 1->1->2->3->3
输出: 1->2->3
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
var deleteDuplicates = function(head) {
    if (!head) return head;
    var n1 = head;
    for (var n2 = head.next; n2; n2 = n2.next ) {
        if (n2.val !== n1.val) {
            n1.next = n2;
            n1 = n1.next;
        }
    }
    n1.next = null;
    return head;
};
```
