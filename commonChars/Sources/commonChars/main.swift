// https://leetcode.com/problems/find-common-characters/submissions/
class Solution {
    // 27.83
    func commonChars(_ A: [String]) -> [String] {
        var map = [Character: [Int]]()
        
        var i = 0
        while i < A.count {
            let str = A[i]
            
            for char in str {
                if var list = map[char] {
                    list[i] = list[i] + 1
                    map[char] = list
                } else {
                    var list = [Int]()
                    // 初始化
                    var j = 0
                    while j < A.count {
                        list.append(0)
                        j += 1
                    }
                    
                    list[i] = 1
                    
                    map[char] = list
                }
            }
            
            i += 1
        }
        
        print(map)
        
        var result = [String]()
        
        // 对 list 进行排序
        for (key,list) in map {
            let sortedList = list.sorted()
            if sortedList.count > 0 {
                let minNum = sortedList[0]
                
                if minNum > 0 {
                    // 取最小值
                    var i = 0
                    while i < minNum {
                        result.append(String(key))
                        i += 1
                    }
                }
            }
        }
       
        return result
    }
}

let s = Solution()
print(s.commonChars(["coooll","looclk","lcook"]))
