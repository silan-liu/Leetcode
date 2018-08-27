// https://leetcode.com/problems/surface-area-of-3d-shapes/description/
func surfaceArea(_ grid: [[Int]]) -> Int {
    var flagMap = [String: Int]()
    
    let rowCount = grid.count
    if rowCount > 0 {
        let columnCount = grid[0].count
        var total = 0

        var i = 0
        while i < rowCount {
            var j = 0
            while j < columnCount  {
                let value = grid[i][j]
                
                if value > 0 {
                    total += value * 4 + 2
                    
                    // 减去覆盖的部分
                    // 上
                    if i - 1 >= 0 {
                        let key = String(i-1) + "_" + String(j)
                        let flag = flagMap[key]
                        if flag == nil {
                            let top = grid[i-1][j]
                            // 最小覆盖*2
                            total -= min(value, top) * 2
                        }
                    }
                    
                    // 下
                    if i + 1 < rowCount {
                        let key = String(i+1) + "_" + String(j)
                        let flag = flagMap[key]
                        if flag == nil {
                            let bottom = grid[i+1][j]
                            total -= min(value, bottom) * 2
                            
                        }
                    }
                    
                    // 左
                    if j - 1 >= 0 {
                        let key = String(i) + "_" + String(j - 1)
                        let flag = flagMap[key]
                        if flag == nil {
                            let left = grid[i][j-1]
                            total -= min(value, left) * 2
                            
                        }
                    }
                    
                    // 右
                    if j + 1 < columnCount {
                        let key = String(i) + "_" + String(j + 1)
                        let flag = flagMap[key]
                        
                        if flag == nil {
                            let right = grid[i][j+1]
                            total -= min(value, right) * 2
                        }
                    }
                    
                    let key = String(i) + "_" + String(j)

                    flagMap[key] = 1
                }
                
                j += 1
            }
            
            i += 1
        }
        
        return total
    }
    
    return 0
}


let grid = [[2,2,2],[2,1,2],[2,2,2]]
print(surfaceArea(grid))

