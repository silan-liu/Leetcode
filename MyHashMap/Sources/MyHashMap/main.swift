
// https://leetcode.com/problems/design-hashmap/submissions/
// 10.08%
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


let hashMap = MyHashMap()
hashMap.put(1, 1);
hashMap.put(2, 2);
print(hashMap.get(1));            // returns 1
print(hashMap.get(3));            // returns -1 (not found)
hashMap.put(2, 1);          // update the existing value
print(hashMap.get(2));            // returns 1
hashMap.remove(2);          // remove the mapping for 2
print(hashMap.get(2));            // returns -1 (not found)
