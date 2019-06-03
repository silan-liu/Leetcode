// https://leetcode.com/problems/last-stone-weight/submissions/
class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var tmp = stones
        while tmp.count > 1 {
            let maxList = maxTwoNum(tmp)
            if maxList.count == 2 {
                let max1Index = maxList[0]
                let max2Index = maxList[1]
                
                let max1 = tmp[max1Index]
                let max2 = tmp[max2Index]
                
                if max1 > max2 {
                    // max1
                    tmp[max1Index] = max1 - max2
                    
                    // 删除
                    tmp.remove(at: max2Index)
                } else {
                    // 相等，删除，先删除后面的
                    if max1Index > max2Index {
                        tmp.remove(at: max1Index)
                        tmp.remove(at: max2Index)
                    } else {
                        tmp.remove(at: max2Index)
                        tmp.remove(at: max1Index)
                    }
                }
                
                print(tmp)
            }
        }
        
        if tmp.count > 0 {
            return tmp[0]
        }
        
        return 0
    }
    
    func maxTwoNum(_ stones: [Int]) -> [Int] {
        if stones.count > 0 {
            var max1 = Int.min
            var max2 = Int.min
            var max1Index = 0
            var max2Index = 0
            
            var i = 0
            while i < stones.count {
                let stone = stones[i]
                
                if stone > max1 {
                    max2 = max1
                    max1 = stone
                    
                    max2Index = max1Index
                    max1Index = i
                } else if stone > max2 {
                    max2 = stone
                    max2Index = i
                }
                
                i += 1
            }
        
            return [max1Index, max2Index]
        }
        
        return []
    }
}

let s = Solution()
let stones = [2,7,4,1,8,1,3]
print(s.lastStoneWeight(stones))


