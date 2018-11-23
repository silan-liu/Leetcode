// https://leetcode.com/problems/implement-stack-using-queues/submissions/
class MyStack {
    
    var queue = [Int]()
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        queue.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        if queue.count > 0 {
            return queue.removeLast()
        }
        
        return -1
    }
    
    /** Get the top element. */
    func top() -> Int {
        if queue.count > 0 {
            return queue[queue.count - 1]
        }
        
        return -1
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return queue.count == 0
    }
}

let obj = MyStack()
obj.push(4)
let ret_2: Int = obj.pop()
print(ret_2)
let ret_3: Int = obj.top()
print(ret_3)
let ret_4: Bool = obj.empty()
print(ret_4)

