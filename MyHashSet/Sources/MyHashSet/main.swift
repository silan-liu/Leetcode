// https://leetcode.com/problems/design-hashset/
class MyHashSet {
    var list: [Int]
    
    /** Initialize your data structure here. */
    init() {
        list = [Int]()
    }
    
    func add(_ key: Int) {
        if self.contains(key) {
            return
        }
        
        list.append(key)
    }
    
    func remove(_ key: Int) {
        var i = 0
        while i < list.count {
            if list[i] == key {
                list.remove(at: i)
                break
            }
            i += 1
        }
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        var i = 0
        while i < list.count {
            if list[i] == key {
                return true
            }
            i += 1
        }
        
        return false
    }
}

class Node {
    var value: Int
    var next: Node?
    
    init(_ value: Int, _ next: Node? = nil) {
        self.value = value
    }
}

// 11.90% 
class MyHashSet2 {
    
    var list: [Node] = [Node]()
    var len = 100
    
    /** Initialize your data structure here. */
    init() {
        var i = 0
        while i < len {
            list.append(Node(0))
            i += 1
        }
    }
    
    func add(_ key: Int) {
        let k = hashKey(key)
        var head: Node? = list[k]
        var exist = false
        
        while head?.next != nil {
            // 已存在
            if head?.next?.value == key {
                exist = true
                break
            }
            
            head = head?.next
        }
        
        if !exist {
            head?.next = Node(key)
        }
    }
    
    func remove(_ key: Int) {
        let k = hashKey(key)
        var head: Node? = list[k]
        
        while head?.next != nil, head?.next?.value != key {
            head = head?.next
        }
        
        // 如果存在
        if head?.next != nil {
            head?.next = head?.next?.next
        }
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        let k = hashKey(key)
        let head = list[k]
 
        var tmp = head.next
        while tmp != nil {
            if tmp?.value == key {
                return true
            }
            
            tmp = tmp?.next
        }
        
        return false
    }
    
    func hashKey(_ key: Int) -> Int {
        return key % len
    }
}

let hashSet = MyHashSet()
hashSet.add(1);
hashSet.add(2);
print(hashSet.contains(1))
print(hashSet.contains(3))
hashSet.add(2);
print(hashSet.contains(2))
hashSet.remove(2);
print(hashSet.contains(2))

let hashSet2 = MyHashSet2()
hashSet2.add(1);
hashSet2.add(101);
hashSet2.add(2);
print(hashSet2.contains(1))
print(hashSet2.contains(3))
print(hashSet2.contains(101))
hashSet2.add(2);
print(hashSet2.contains(2))
hashSet2.remove(2);
print(hashSet2.contains(2))
