// https://leetcode.com/problems/squares-of-a-sorted-array/submissions/
class Solution {
    // 60%
    func sortedSquares(_ A: [Int]) -> [Int] {
        var squares = [Int]()
        for n in A {
            squares.append(n * n)
        }
        
        return squares.sorted()
    }
    
    // 100%
    func sortedSquares_2(_ A: [Int]) -> [Int] {
        // 因为 A 已经排好序，找到前面的负数部分从后遍历，和后面的正数部分从前遍历，进行合并
        var negArray = [Int]()
        var result = [Int]()
        
        var i = 0
        while i < A.count {
            if A[i] < 0 {
                negArray.append(A[i])
                i += 1
            } else {
                break
            }
        }
        
        var j = negArray.count - 1
        while j >= 0, i < A.count {
            if abs(negArray[j]) < A[i] {
                // 加入数组
                result.append(negArray[j] * negArray[j])
                j -= 1
            } else {
                result.append(A[i] * A[i])
                i += 1
            }
        }
        
        while j >= 0 {
            result.append(negArray[j] * negArray[j])
            j -= 1
        }
        
        while i < A.count {
            result.append(A[i] * A[i])
            i += 1
        }
        
        return result
    }
}

let s = Solution()
let A = [-10, -3, -1]
print(s.sortedSquares(A))
print(s.sortedSquares_2(A))
