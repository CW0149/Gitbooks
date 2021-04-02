# [数据流中的第K大元素](https://leetcode-cn.com/problems/kth-largest-element-in-a-stream)

### 问题

设计一个找到数据流中第K大元素的类（class）。注意是排序后的第K大元素，不是第K个不同的元素。

你的 KthLargest 类需要一个同时接收整数 k 和整数数组nums 的构造器，它包含数据流中的初始元素。每次调用 KthLargest.add，返回当前数据流中第K大的元素。

示例:

```
int k = 3;
int[] arr = [4,5,8,2];
KthLargest kthLargest = new KthLargest(3, arr);
kthLargest.add(3);   // returns 4
kthLargest.add(5);   // returns 5
kthLargest.add(10);  // returns 5
kthLargest.add(9);   // returns 8
kthLargest.add(4);   // returns 8
```
说明:
你可以假设 nums 的长度≥ k-1 且k ≥ 1。



### 解答

```
/**
 * @param {number} k
 * @param {number[]} nums
 */
// 先对数组进行排序，调用add进行插入排序
// 也可二分查找到需要插入对位置，然后对数组分割
var KthLargest = function(k, nums) {
    this.k = k
    this.nums = nums.sort((a, b) => b - a)
};

/**
 * @param {number} val
 * @return {number}
 */
KthLargest.prototype.add = function(val) {
    let i = this.nums.length - 1
    while (val > this.nums[i]) {
        this.nums[i + 1] = this.nums[i]
        i -= 1
    }
    this.nums[i + 1] = val
    return this.nums[this.k - 1]
};

/**
 * Your KthLargest object will be instantiated and called as such:
 * var obj = Object.create(KthLargest).createNew(k, nums)
 * var param_1 = obj.add(val)
 */
```
