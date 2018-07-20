// https://leetcode.com/problems/transpose-matrix/description/
func transpose(_ A: [[Int]]) -> [[Int]] {
    var result = [[Int]]()
    
    let rowCount = A.count
    if rowCount > 0 {
        let colCount = A[0].count
        
        var col = 0
        
        // 按列来遍历
        while col < colCount  {
            var row = 0
            var array = [Int]()
            
            while row < rowCount {
                // 列变成行
                array.append(A[row][col])
                row += 1
            }
            
            result.append(array)
            
            col += 1
        }
    }
    
    return result
}

let matrix = [[1,2,3],[4,5,6]]
print(transpose(matrix))

