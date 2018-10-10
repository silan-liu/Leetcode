
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

let hashSet = MyHashSet()
hashSet.add(1);
hashSet.add(2);
print(hashSet.contains(1))
print(hashSet.contains(3))
hashSet.add(2);
print(hashSet.contains(2))
hashSet.remove(2);
print(hashSet.contains(2))
