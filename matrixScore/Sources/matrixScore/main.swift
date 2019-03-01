import Foundation

// https://leetcode.com/problems/score-after-flipping-matrix/submissions/
class Solution {
    var rowCount = 0
    var columnCount = 0

    func matrixScore(_ A: [[Int]]) -> Int {
        rowCount = A.count
        if rowCount > 0 {
            columnCount = A[0].count
        }

        var list = A

        var column = 0
        
        while column < columnCount {
            
            if shouldFlipColumn(list, column) {
                flipColumn(&list, column)
            }
            
            // 每行只需调整一次。
            if column == 0 {
                var row = 0
                while row < rowCount {
                    if shouldFlipRow(list, row) {
                        flipRow(&list, row)
                    }
                    
                    row += 1
                }
            }
            
            column += 1
        }

        
        
        print(list)

        // 计算和
        let sum = getSum(list)

        return sum
    }

    func shouldFlipColumn(_ A: [[Int]], _ column: Int) -> Bool {
        // 如果列中1的个数n * 2 >= columnCount，则不用
        if column < columnCount {
            var i = 0
            var countOfOne = 0
            while i < rowCount {
                if A[i][column] == 1 {
                    countOfOne += 1
                }

                i += 1
            }

            if countOfOne * 2 >= rowCount {
                return false
            }

            return true
        }

        return false
    }

    func shouldFlipRow(_ A: [[Int]], _ row: Int) -> Bool {
        // 如果第一位为1，则不用
        if row < rowCount {
            if let first = A[row].first {
                if first == 0 {
                    return true
                }
            }
        }

        return false
    }

    func flipRow(_ A: inout [[Int]], _ row : Int) {
        if row < rowCount {
            var i = 0
            while i < columnCount {
                A[row][i] = 1 - A[row][i]
                i += 1
            }
        }
    }

    func flipColumn(_ A: inout [[Int]], _ colomn : Int) {
        if colomn < columnCount {
            var i = 0
            while i < rowCount {
                let value = A[i][colomn]
                A[i][colomn] = 1 - value
                i += 1
            }
        }
    }

    func getSum(_ A: [[Int]]) -> Int {
        var i = 0
        var sum = 0

        while i < rowCount {
            var j = 0
            var rowSum = 0
            while j < columnCount {
                if (A[i][j] == 1) {
                    rowSum += Int(pow(Double(2), Double(columnCount - j - 1)))
                }
                
                j += 1
            }

            sum += rowSum

            i += 1
        }

        return sum
    }
}

let matrix = [[1,0,1,1,0],[1,1,1,0,1],[0,1,1,0,1]]
let s = Solution()
print(s.matrixScore(matrix))
