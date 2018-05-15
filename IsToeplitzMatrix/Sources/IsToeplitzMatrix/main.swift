// https://leetcode.com/problems/toeplitz-matrix/description/
func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
    if matrix.count < 1 {
        return false
    }
    
    let rowCount = matrix.count
    let columnCount = matrix[0].count
    
    var row = 0
    var column = 1
    
    while row < rowCount {
        // 基准数
        var i = row
        var j = 0
        
        let compare = matrix[i][j]
        
        while i + 1 < rowCount, j + 1 < columnCount {
            let value = matrix[i+1][j+1]
            if compare != value {
                return false
            }
            
            i += 1
            j += 1
        }
        
        row += 1
    }
    
    while column < columnCount {
        var i = 0
        var j = column
        
        let compare = matrix[i][j]
        
        while i + 1 < rowCount, j + 1 < columnCount {
            let value = matrix[i+1][j+1]
            if compare != value {
                return false
            }
            
            i += 1
            j += 1
        }
        
        column += 1
    }
    
    return true
}

let matrix = [[1,2],[2,2]]

print(isToeplitzMatrix(matrix))
