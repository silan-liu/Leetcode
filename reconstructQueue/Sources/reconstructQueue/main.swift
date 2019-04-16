
// https://leetcode.com/problems/queue-reconstruction-by-height/submissions/
class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        
        var map = [Int: [[Int]]]()
        for p in people {
            if p.count == 2 {
                let height = p[0]
                if var list = map[height] {
                    list.append(p)
                    map[height] = list
                } else {
                    var list = [[Int]]()
                    list.append(p)
                    map[height] = list
                }
            }
        }
        
       let sortedMap = map.sorted { (arg0, arg1) -> Bool in
            
            let (key1, _) = arg0
            let (key2, _) = arg1
            
            return key1 > key2
        }
        
        print(sortedMap)
        
        for (_, value) in sortedMap {
            let sortedValue = value.sorted { (v1, v2) -> Bool in
                return v1[1] < v2[1]
            }
            
            print(sortedValue)
            var i = 0
            while i < sortedValue.count {
                
                let value = sortedValue[i]
                if value.count == 2 {
                    // 其实不用找位置，直接插入到 value[1]
                    result.insert(value, at: value[1])

//                    if value[1] == 0 {
//                        result.insert(value, at: 0)
//                    } else {
//                        // 在 result 中找到合适的位置
//                        result.insert(value, at: value[1])
//                        var j = 0
//                        var count = 0
//                        while j < result.count {
//                            if result[j][0] >= value[0] {
//                                count += 1
//
//                                if count == value[1] {
//                                    result.insert(value, at: j + 1)
//                                    break
//                                }
//                            }
//
//                            j += 1
//                        }
//
//                        // 未找到合适的位置，直接加在后面
//                        if j == result.count {
//                            result.append(value)
//                        }
//                    }
                }
                
                i += 1
            }
            
        }
        
        return result
    }
}

let s = Solution()
let people = [[1,5],[2,1],[3,3],[4,0],[5,0],[7,0],[8,0]]
print(s.reconstructQueue(people))
