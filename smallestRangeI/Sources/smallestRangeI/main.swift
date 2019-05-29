// https://leetcode.com/problems/smallest-range-i/submissions/
class Solution {
    func smallestRangeI(_ A: [Int], _ K: Int) -> Int {
        if A.count == 1 {
            return 0
        }
        
        let sortedA = A.sorted()
        
        // 最大数与最小数之差
        let difference = sortedA.last! - sortedA.first!
        
        // 两个数分别加 x 后，差值范围 [-2k, 2k]，如果能补齐，则为 0
        if difference <= 2 * K {
            return 0
        } else {
            // 补最大值
            return difference - 2 * K
        }
    }
    
    func smallestRangeI_2(_ A: [Int], _ K: Int) -> Int {
        if A.count <= 1 {
            return 0
        }
        
        var minA = A[0]
        var maxA = A[0]
        for a in A {
            if a > maxA {
                maxA = a
            } else if a < minA {
                minA = a
            }
        }
        
        // 最大数与最小数之差
        let difference = maxA - minA
        
        // 两个数分别加 x 后，差值范围 [-2k, 2k]，如果能补齐，则为 0
        if difference <= 2 * K {
            return 0
        } else {
            // 补最大值
            return difference - 2 * K
        }
    }
}

let s = Solution()
let A = [0,10]
let K = 2
print(s.smallestRangeI(A, K))
print(s.smallestRangeI_2(A, K))
