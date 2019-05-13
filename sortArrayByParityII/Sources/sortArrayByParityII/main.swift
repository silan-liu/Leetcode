// https://leetcode.com/problems/sort-array-by-parity-ii/submissions/
class Solution {
    // 54.97%
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        if A.count % 2 != 0 {
            return []
        }
        
        var oddList = [Int]()
        var evenList = [Int]()
        
        var oddIndex = 0
        var evenIndex = 0
        
        for a in A {
            if a % 2 != 0 {
                oddList.append(a)
            } else {
                evenList.append(a)
            }
        }
        
        var result = [Int]()
        var i = 0
        while i < A.count {
            // 奇数
            if i % 2 != 0 {
                if oddIndex >= 0, oddIndex < oddList.count {
                    result.append(oddList[oddIndex])
                    oddIndex += 1
                }
            } else {
                if evenIndex >= 0, evenIndex < evenList.count {
                    result.append(evenList[evenIndex])
                    evenIndex += 1
                }
            }
            
            i += 1
        }
        
        return result
    }
}

let s = Solution()
let A = [4,2,5,7,9,8]
print(s.sortArrayByParityII(A))
