// https://leetcode.com/problems/magic-squares-in-grid/submissions/
func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
    if grid.count == 0 {
        return 0
    }
    
    let row = grid.count
    let column = grid[0].count
    var count = 0
    
    var i = 0
    while i < row {
        if i + 3 > row {
            break
        }
        
        var j = 0
        while j < column {
            
            if j + 3 > column {
                break
            }
            
            // 取3*3矩阵
            var subGrid = [[Int]]()
            
            var k = i
            while k < i + 3 {
                let rows = grid[k][j..<j+3]
                subGrid.append([Int](rows))
                k += 1
            }
            
            if isMagicSquare(subGrid) {
                count += 1
            }
            
            j += 1
        }
        
        i += 1
    }
    
    return count
}

func isMagicSquare(_ grid: [[Int]]) -> Bool {
    if grid.count != 3 {
        return false
    }
    
    let column = grid[0].count
    if column != 3 {
        return false
    }
    
    var map = [Int: Int]()
    
    // 是否1-9
    var i = 0
    var j = 0
    while i < 3 {
        j = 0
        while j < 3 {
            let num = grid[i][j]
            if num > 9 || num < 1 {
                return false
            }
            
            // 有重复
            if let _ = map[num] {
                return false
            }
            
            map[num] = 1
            j += 1
        }
        
        i += 1
    }
    
    let sum = grid[0][0] + grid[0][1] + grid[0][2]
    i = 1
    j = 0
    
    // 计算横排
    while i < 3 {
        var total = 0
        j = 0
        while j < 3 {
            total += grid[i][j]
            j += 1
        }
        
        if total != sum {
            return false
        }
        
        i += 1
    }
    
    // 计算竖排
    j = 0
    while j < 3 {
        i = 0
        var total = 0
        while i < 3 {
            total += grid[i][j]
            
            i += 1
        }
        
        if total != sum {
            return false
        }
        
        j += 1
    }
    
    // 计算对角线
    var total = grid[0][0] + grid[1][1] + grid[2][2]
    if total != sum {
        return false
    }
    
    total = grid[0][2] + grid[1][1] + grid[2][0]
    if total != sum {
        return false
    }
    
    return true
}

let grid = [[1,8,6],[10,5,0],[4,2,9]]
print(numMagicSquaresInside(grid))
