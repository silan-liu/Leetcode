
// https://leetcode.com/problems/matrix-cells-in-distance-order/
class Solution {
    func allCellsDistOrder(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
        var lenList = [[[Int]]]()
        
        // 最大值 R + C
        var i = 0
        while i <= R + C + 1 {
            lenList.append([])
            i += 1
        }
        
        var j = 0
        while j < R {
            var k = 0
            while k < C {
                let len = abs(j - r0) + abs(k - c0)
                if len >= 0 && len < lenList.count {
                    lenList[len].append([j, k])
                }
                
                k += 1
            }
            
            j += 1
        }
        
        // 去除空数组
       var result = [[Int]]()
        i = 0
        while i < lenList.count {
            if lenList[i].count > 0 {
                result.append(contentsOf: lenList[i])
            }
            
            i += 1
        }
        
        return result
    }
}

let s = Solution()

let R = 2, C = 3, r0 = 1, c0 = 2

print(s.allCellsDistOrder(R, C, r0, c0))
