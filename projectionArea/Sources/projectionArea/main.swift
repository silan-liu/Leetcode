func projectionArea(_ grid: [[Int]]) -> Int {
    var flagMap = [String: Int]()
    
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
        
        // 按列遍历
        var column = [Int]()
        i = 0
        j = 0
        while i < rowCount {
            column.append(grid[i][j])
            i += 1
        }
        
        
        while i < rowCount {
            j = 0
            while j < columnCount  {
                let value = grid[i][j]
                
                if value > 0 {
                    total += value * 4 + 1
                    
                    // 减去覆盖的部分
                    // 上
                    if i - 1 >= 0 {
                        let key = String(i-1) + "_" + String(j)
                        let flag = flagMap[key]
                        if flag == nil {
                            let top = grid[i-1][j]
                            // 最小覆盖*2
                            total -= min(value, top) * 2
                            
                            flagMap[key] = 1
                        }
                    }
                    
                    // 下
                    if i + 1 < rowCount {
                        let key = String(i+1) + "_" + String(j)
                        let flag = flagMap[key]
                        if flag == nil {
                            let bottom = grid[i+1][j]
                            total -= min(value, bottom) * 2
                            
                            flagMap[key] = 1
                        }
                    }
                    
                    // 左
                    if j - 1 >= 0 {
                        let key = String(i) + "_" + String(j - 1)
                        let flag = flagMap[key]
                        if flag == nil {
                            let left = grid[i][j-1]
                            total -= min(value, left) * 2
                            
                            flagMap[key] = 1
                        }
                    }
                    
                    // 右
                    if j + 1 < columnCount {
                        let key = String(i) + "_" + String(j + 1)
                        let flag = flagMap[key]
                        
                        if flag == nil {
                            let right = grid[i][j+1]
                            total -= min(value, right) * 2
                            
                            flagMap[key] = 1
                        }
                    }
                }
                
                j += 1
            }
            
            i += 1
        }
        
        return total
    }
    
    return 0
}

let grid = [[1,2],[3,4]]
print(projectionArea(grid))
