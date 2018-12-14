// https://leetcode.com/problems/min-stack/submissions/
class MinStack {
    
    var list: [Int]
    
    var min1 = Int.max
    var minIndex1 = -1
    
    var min2 = Int.max
    var minIndex2 = -1
    
    /** initialize your data structure here. */
    init() {
        list = [Int]()
    }
    
    func push(_ x: Int) {
        list.append(x)
        if x < min1 {
            min2 = min1
            minIndex2 = minIndex1
            
            min1 = x
            minIndex1 = list.count - 1
        } else if x < min2 {
            min2 = x
            minIndex2 = list.count - 1
        }
    }
    
    func findMin(_ index: Int) {
        var i = index
        while i >= 0 {
            let x = list[i]
            
            if x < min1 {
                min2 = min1
                minIndex2 = minIndex1
                
                min1 = x
                minIndex1 = i
            } else if x < min2 {
                min2 = x
                minIndex2 = i
            }
            
            i -= 1
        }
    }
    
    func pop() {
        if list.count - 1 == minIndex1 {
            min1 = Int.max
            minIndex1 = -1
            
            findMin(list.count - 2)
        } else if list.count - 1 == minIndex2 {
            min2 = Int.max
            minIndex2 = -1
        }
        
        list.removeLast()
    }
    
    func top() -> Int {
        if list.count > 0 {
            return list.last!
        }
        
        return -1
    }
    
    func getMin() -> Int {
        return min1
    }
}

class MinStack2 {
    
    var list: [Int]
    var minList: [Int]
    
    /** initialize your data structure here. */
    init() {
        list = [Int]()
        minList = [Int]()
    }
    
    func push(_ x: Int) {
        list.append(x)
        
        if minList.count == 0 {
            minList.append(x)
        } else {
            // 记录小的值
            if x <= minList.last! {
                minList.append(x)
            }
        }
    }
    
    
    func pop() {
        let top = self.top()
        if minList.count > 0 {
            if minList.last! == top {
                minList.removeLast()
            }
        }
        
        list.removeLast()
    }
    
    func top() -> Int {
        if list.count > 0 {
            return list.last!
        }
        
        return -1
    }
    
    func getMin() -> Int {
        if minList.count > 0 {
            return minList.last!
        }
        
        return Int.max
    }
}


let obj = MinStack()
obj.push(2);
obj.push(0);
obj.push(3);
obj.push(0);

obj.pop()
print(obj.getMin())

obj.pop()
print(obj.getMin())

obj.pop()
print(obj.getMin())

let obj2 = MinStack2()
obj2.push(2);
obj2.push(0);
obj2.push(3);
obj2.push(0);

obj2.pop()
print(obj2.getMin())

obj2.pop()
print(obj2.getMin())

obj2.pop()
print(obj2.getMin())


