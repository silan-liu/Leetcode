// https://leetcode.com/problems/rotting-oranges/submissions/
class Solution {
    // 100.00%
    func orangesRotting(_ grid: [[Int]]) -> Int {
        
        var tmp = grid
        
        if grid.count > 0 {
            let rows = grid.count
            let coloumns = grid[0].count
            
            var rottenPostions = [[Int]]()
            var emptyCount = 0
            
            // 遍历，找到 rotten 的位置
            var i = 0
            while i < rows {
                var j = 0
                while j < coloumns {
                    
                    let value = grid[i][j]
                    
                    // refresh
                    if value == 1 {
                        var flag = false
                        
                        // 上下左右，有没有相邻
                        if (i > 0 && grid[i-1][j] != 0)
                        || (i < rows - 1 && grid[i+1][j] != 0)
                        || (j > 0 && grid[i][j-1] != 0)
                        || (j < coloumns - 1 && grid[i][j+1] != 0) {
                            flag = true
                        }
                        
                        // 如果没有相邻，则不会坏掉。
                        if !flag {
                            return -1
                        }
                    } else if value == 2{
                        rottenPostions.append([i,j])
                    } else {
                        emptyCount += 1
                    }
                    
                    j += 1
                }
                
                i += 1
            }
            
            // 总共需要rotten的个数
            let rottenCount = rows * coloumns - emptyCount
            
            // 已经满足条件，需在下面的条件之前判断。
            if rottenPostions.count == rottenCount {
                return 0
            }
            
            // 不存在腐烂的
            if rottenPostions.count == 0 {
                return -1
            }
            
            var minutes = 1
            
            var k = 0
            var len = rottenPostions.count
            while k < len {
                let x = rottenPostions[k][0]
                let y = rottenPostions[k][1]
                
                // 上
                if x > 0, tmp[x-1][y] == 1 {
                    tmp[x-1][y] = 2
                    rottenPostions.append([x-1, y])
                }
                
                // 下
                if x < rows - 1, tmp[x+1][y] == 1 {
                    tmp[x+1][y] = 2
                    rottenPostions.append([x+1, y])
                }
                
                // 左
                if y > 0, tmp[x][y-1] == 1 {
                    tmp[x][y-1] = 2
                    rottenPostions.append([x, y-1])
                }
                
                // 右
                if y < coloumns - 1, tmp[x][y+1] == 1 {
                    tmp[x][y+1] = 2
                    rottenPostions.append([x, y+1])
                }
                
                k += 1
                
                // 满足条件
                if rottenPostions.count == rottenCount {
                    return minutes
                }
                
                // 到最后
                if k == len {
                    minutes += 1
                    len = rottenPostions.count
                }
            }
        }
        
        return -1
    }
}

let s = Solution()
let grid = [[0,2]]
print(s.orangesRotting(grid))
