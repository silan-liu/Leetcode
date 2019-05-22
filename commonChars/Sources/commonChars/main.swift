// https://leetcode.com/problems/find-common-characters/submissions/
class Solution {
    // 27.83%
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
    
    // 61.74
    func commonChars2(_ A: [String]) -> [String] {
        var dict = [Character: Int]()
        
        // 只需对比在第一个str出现的所有字符
        if A.count > 0 {
            let str = A[0]
            var i = 0
            
            let list = Array(str)
            while i < list.count {
                let char = list[i]
                if let count = dict[char] {
                    dict[char] = count + 1
                } else {
                    dict[char] = 1
                }
                
                i += 1
            }
        }
        
        // 遍历后面的string，比较出现次数大小
        var i = 1
        while i < A.count {
            let str = A[i]
            var tmpDict = [Character: Int]()
            var j = 0
            
            let list = Array(str)
            while j < list.count {
                let char = list[j]

                // 计算当前str 每个字符的个数
                if let count = tmpDict[char] {
                    tmpDict[char] = count + 1
                } else {
                    tmpDict[char] = 1
                }
                
                j += 1
            }
            
            // 取最小值
            for (key,value) in dict {
 
                if let count = tmpDict[key] {
                    dict[key] = min(value, count)
                } else {
                    dict[key] = 0
                }
            }
                
            i += 1
        }
        
        var result = [String]()
        
        for (key,value) in dict {
            if value > 0 {
                var i = 0
                while i < value {
                    result.append(String(key))
                    i += 1
                }
            }
        }
        
        return result
    }
}

let s = Solution()
print(s.commonChars(["coooll","looclk","lcook"]))
print(s.commonChars2(["coooll","looclk","lcook"]))
