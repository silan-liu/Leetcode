// https://leetcode.com/problems/squares-of-a-sorted-array/submissions/
class Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        var squares = [Int]()
        for n in A {
            squares.append(n * n)
        }
        
        return squares.sorted()
    }
}

let s = Solution()
let A = [-7,-3,2,3,11]
print(s.sortedSquares(A))
