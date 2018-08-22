// https://leetcode.com/problems/projection-area-of-3d-shapes/description/
func projectionArea(_ grid: [[Int]]) -> Int {
    
    let rowCount = grid.count
    if rowCount > 0 {
        let columnCount = grid[0].count
        
        var total = 0
        var i = 0
        var j = 0
        
        // 按行遍历
        var row = grid[0]
        i = 1
        while i < rowCount {
            let next = grid[i]
            
            // 计算最大的值
            var j = 0
            while j < columnCount {
                if row[j] < next[j] {
                    row[j] = next[j]
                }
                
                j += 1
            }
            
            i += 1
        }
        
        for value in row {
            total += value
        }
        
        // 按列遍历
        var column = [Int]()
        i = 0
        j = 0
        while i < rowCount {
            let value = grid[i][j]
            column.append(value)
            
            // 计算地面阴影
            if value > 0 {
                total += 1
            }
            i += 1
        }
        
        j = 1
        
        while j < columnCount {
            i = 0
            while i < rowCount {
                let value = grid[i][j]

                if column[i] < value {
                    column[i] = value
                }
                
                // 计算地面阴影
                if value > 0 {
                    total += 1
                }
                
                i += 1
            }
            
            j += 1
        }
        
        for value in column {
            total += value
        }
        
        return total
    }
    
    return 0
}

let grid = [[2,2,2],[2,1,2],[2,2,2]]
print(projectionArea(grid))
