// https://leetcode.com/problems/daily-temperatures/submissions/
class Solution {
    // 超时
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        var i = 0
        var j = 0
        var result = [Int]()
        
        while i < T.count {
            j = i
            
            // 找到第一个比它大的数
            while j < T.count, T[j] <= T[i] {
                j += 1
            }
            
            if j != T.count {
                result.append(j - i)
            } else {
                result.append(0)
            }
            
            i += 1
        }
        
        return result
    }
    
    // 20.25%
    func dailyTemperatures_2(_ T: [Int]) -> [Int] {
        // 记录 temperature 所对应的 index
        var map = [Int: [Int]]()
        
        var result = [Int]()

        var i = 0
        while i < T.count {
            
            if var list = map[T[i]] {
                list.append(i)
                map[T[i]] = list
            } else {
                map[T[i]] = [i]
            }
            
            i += 1
        }
        
        let sorted = map.keys.sorted()
     
        i = 0
        while i < T.count {
            if var curTmpList = map[T[i]], curTmpList.count > 0 {
                var j = 0
                
                // 找到离它最近的数
                var minIndex = Int.max
                while j < sorted.count {
                    if sorted[j] > T[i] {
                        // 找到在其后的index
                        let tmpList = map[sorted[j]]!
                        
                        for index in tmpList {
                            if index > i {
                                if index < minIndex {
                                    minIndex = index
                                }
                                
                                break
                            }
                        }
                    }
                    
                    j += 1
                }
                
                if minIndex != Int.max {
                    result.append(minIndex - i)
                } else {
                    result.append(0)
                }
                
                // 该数已经处理过了，删除
                curTmpList.remove(at: 0)
                map[T[i]] = curTmpList
            }
            
            i += 1
        }
        
        return result
    }
}

let s = Solution()
let T = [71,76,71,76,71,76,76,78,74,33]
print(s.dailyTemperatures(T))
print(s.dailyTemperatures_2(T))
