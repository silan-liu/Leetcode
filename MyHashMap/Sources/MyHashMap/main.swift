
// https://leetcode.com/problems/design-hashmap/submissions/
// 10.08%，比较取巧，有 1000001 个空位。
class MyHashMap {
    var array: [Int]
    
    /** Initialize your data structure here. */
    init() {
        array = [Int]()
        
        var i = 0
        while i <= 1000000 {
            array.append(-1)
            i += 1
        }
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        array[key] = value
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        if key >= 0 && key < array.count {
            return array[key]
        }
        
        return -1
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        array[key] = -1
    }
}

class ListNode {
    var val: Int
    var key: Int
    var next: ListNode?
    
    init(_ val: Int, _ key: Int, _ next: ListNode? = nil) {
        self.val = val
        self.key = key
        self.next = next
    }
}

// 使用链表解决冲突，78.15%
class MyHashMap2 {
    
    var list: [ListNode?]
    var len = 1000
    
    /** Initialize your data structure here. */
    init() {
        list = [ListNode]()
        
        var i = 0
        while i < len {
            list.append(nil)
            i += 1
        }
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        let index = bucket(key)
        let head = list[index]
        
        // 查找有没有相同的值
        if head == nil {
            // 虚拟 head，方便删除
            let head = ListNode(-1, -1)
            head.next = ListNode(value, key)
            
            list[index] = head
        } else {
            var tmp: ListNode? = head!.next
            var pre: ListNode? = head!
            var find = false
            while tmp != nil {
                // 如果有相同的 key，则更新 value
                if tmp?.key == key {
                    tmp?.val = value
                    find = true
                    break
                }
                
                pre = tmp
                tmp = tmp?.next
            }
            
            if !find {
                pre?.next = ListNode(value, key)
            }
        }
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        
        let index = bucket(key)
        let head = list[index]
        
        if head == nil {
            return -1
        } else {
            var tmp: ListNode? = head!.next
            
            while tmp != nil {
                if tmp!.key == key {
                    return tmp!.val
                }
                
                tmp = tmp!.next
            }
        }
        
        return -1
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        let index = bucket(key)
        let head = list[index]
        
        if let head = head {
            var tmp: ListNode? = head.next
            var pre: ListNode? = head
            
            while tmp != nil, tmp?.key != key {
                pre = tmp
                tmp = tmp!.next
            }
            
            if pre?.next != nil {
                pre?.next = pre?.next?.next
            }
        }
    }
    
    func bucket(_ key: Int) -> Int {
        return key % len
    }
}

let hashMap = MyHashMap()
hashMap.put(1, 1);
hashMap.put(2, 2);
print(hashMap.get(1));            // returns 1
print(hashMap.get(3));            // returns -1 (not found)
hashMap.put(2, 1);          // update the existing value
print(hashMap.get(2));            // returns 1
hashMap.remove(2);          // remove the mapping for 2
print(hashMap.get(2));            // returns -1 (not found)

let hashMap2 = MyHashMap2()

hashMap2.put(1, 1);
hashMap2.put(2, 2);
print(hashMap2.get(1));            // returns 1
print(hashMap2.get(3));            // returns -1 (not found)
hashMap2.put(2, 1);          // update the existing value
print(hashMap2.get(2));            // returns 1
hashMap2.remove(2);          // remove the mapping for 2
print(hashMap2.get(2));            // returns -1 (not found)
hashMap2.put(2000, 20)
print(hashMap2.get(2000))
hashMap2.put(3000, 30)
print(hashMap2.get(3000))
hashMap2.put(3000, 40)
print(hashMap2.get(3000))
hashMap2.remove(3000)
print(hashMap2.get(3000))

