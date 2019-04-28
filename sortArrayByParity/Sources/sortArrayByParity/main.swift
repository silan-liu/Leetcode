// https://leetcode.com/problems/sort-array-by-parity/submissions/
class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        // 偶数在前，奇数在后
        var evenList = [Int]()
        var oddList = [Int]()
        
        for n in A {
            if n % 2 == 0 {
                evenList.append(n)
            } else {
                oddList.append(n)
            }
        }
        
        return evenList + oddList
    }
}

let s = Solution()
let A = [0,3,1,2,4]
print(s.sortArrayByParity(A))

