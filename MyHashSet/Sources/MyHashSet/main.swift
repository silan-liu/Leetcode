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

struct Node {
    var value: Int
}

struct LinkList {
    var node: Node
    var next: Node?
}

class MyHashSet2 {
    
    var list: [LinkList] = [LinkList]()
    var len = 100
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    func add(_ key: Int) {
        
    }
    
    func remove(_ key: Int) {
        
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        let k = hashKey(key)
        
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
