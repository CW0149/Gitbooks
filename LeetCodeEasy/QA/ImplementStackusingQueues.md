# [用队列实现栈](https://leetcode-cn.com/problems/implement-stack-using-queues)

### 问题

使用队列实现栈的下列操作：

```
push(x) -- 元素 x 入栈
pop() -- 移除栈顶元素
top() -- 获取栈顶元素
empty() -- 返回栈是否为空
```
注意:

* 你只能使用队列的基本操作-- 也就是 push to back, peek/pop from front, size, 和 is empty 这些操作是合法的。
* 你所使用的语言也许不支持队列。 你可以使用 list 或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。
* 你可以假设所有操作都是有效的（例如, 对一个空的栈不会调用 pop 或者 top 操作）。

### 解答

```
/**
 * Initialize your data structure here.
 */

// 注意构造函数return
var Queue = function() {
    this.queue = [];
}
Queue.prototype.push = function(x) {
    this.queue.unshift(x);
    return this.queue;
}
Queue.prototype.pop = function() {
    return this.queue.pop();
}
Queue.prototype.peek = function(x) {
    return this.queue[this.queue.length - 1];
}
Queue.prototype.size = function() {
    return this.queue.length;
}
Queue.prototype.isEmpty = function() {
    return this.queue.length === 0;
}

var MyStack = function() {
    this.queue = new Queue();
};

/**
 * Push element x onto stack.
 * @param {number} x
 * @return {void}
 */
MyStack.prototype.push = function(x) {
    var count = this.queue.size();
    this.queue.push(x);
    while (count--) {
        this.queue.push(this.queue.pop());
    }
    return x;
};

/**
 * Removes the element on top of the stack and returns that element.
 * @return {number}
 */
MyStack.prototype.pop = function() {
    return this.queue.pop();
};

/**
 * Get the top element.
 * @return {number}
 */
MyStack.prototype.top = function() {
    return this.queue.peek();
};

/**
 * Returns whether the stack is empty.
 * @return {boolean}
 */
MyStack.prototype.empty = function() {
    return this.queue.isEmpty();
};

/**
 * Your MyStack object will be instantiated and called as such:
 * var obj = Object.create(MyStack).createNew()
 * obj.push(x)
 * var param_2 = obj.pop()
 * var param_3 = obj.top()
 * var param_4 = obj.empty()
 */
```