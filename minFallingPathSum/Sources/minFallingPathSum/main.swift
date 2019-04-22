// https://leetcode.com/problems/minimum-falling-path-sum/submissions/
class Solution {
    
    var minSum = Int.max
    var r = 0
    var c = 0
    var list = [[Int]]()
    
    // 超时
    func minFallingPathSum(_ A: [[Int]]) -> Int {
        r = A.count
        if r > 0 {
            list = A
            c = A[0].count
            
            var col = 0
            while col < c {
                print("begin:\(A[0][col])")
                recursive(1, col, A[0][col])
                col += 1
            }
        }
        
        return minSum
    }
    
    func recursive(_ row: Int, _ col: Int, _ sum: Int) {
        if row < 0 || row >= list.count {
            print("end")
            if sum < minSum {
                minSum = sum
            }
        } else {
            // 列相隔不超过1
            var j = col - 1
            while j <= col + 1 {
                if j >= 0, j < c {
                    let tmp = sum + list[row][j]
                    print("\(A[row][j])")
                    recursive(row + 1, j, tmp)
                }
                
                j += 1
            }
        }
    }
}

let A = [[1,2,3],[4,5,6],[7,8,9]]
let s = Solution()
print(s.minFallingPathSum(A))
