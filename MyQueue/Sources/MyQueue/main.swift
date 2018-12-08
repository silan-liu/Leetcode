// https://leetcode.com/problems/implement-queue-using-stacks/description/
class MyQueue {
    
    var list: [Int]
    /** Initialize your data structure here. */
    init() {
        list = [Int]()
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        list.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        assert(list.count > 0)
        if list.count > 0 {
            let first = list[0]
            list.remove(at: 0)
            return first
        }
        
        return -1
    }
    
    /** Get the front element. */
    func peek() -> Int {
        assert(list.count > 0)

        if list.count > 0 {
            return list[0]
        }
        
        return -1
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return list.count <= 0
    }
}


let obj = MyQueue()
//obj.push(5)

let ret_2: Int = obj.pop()
print(ret_2)

let ret_3: Int = obj.peek()
print(ret_3)

let ret_4: Bool = obj.empty()
print(ret_4)
 

