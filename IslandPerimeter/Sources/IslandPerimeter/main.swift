
// https://leetcode.com/problems/island-perimeter/description/
// 求周长
/*
 主要思路：
 1. 计算出二维数组中1的个数islandCount，*4则为完全不相邻的总周长
 2. 计算出有多少island的边相邻，假设为adjacentCount，逐个遍历数组，只需要计算右边和下边相邻。
 3. 最终的周长：islandCount * 4 - 2 * adjacentCount
 */
func islandPerimeter(_ grid: [[Int]]) -> Int {
    
    guard grid.count > 0 else {
        return 0
    }
    
    // island总数
    var islandCount = 0
    
    // 相邻的island边数
    var adjacentCount = 0
    
    let rowCount = grid.count
    let columnCount = grid[0].count
    
    var rowIndex = 0
    while rowIndex < rowCount {
        var columnIndex = 0
        while columnIndex < columnCount {
            let item = grid[rowIndex][columnIndex]
            if item == 1 {
                islandCount += 1
                
                // 寻找相邻的island
                // 右边
                if columnIndex + 1 < columnCount {
                    if grid[rowIndex][columnIndex + 1] == 1 {
                        adjacentCount += 1
                    }
                }
                
                // 下边
                if rowIndex + 1 < rowCount {
                    if grid[rowIndex + 1][columnIndex] == 1 {
                        adjacentCount += 1
                    }
                }
            }
            
            columnIndex += 1
        }
        
        rowIndex += 1
    }
    
    // 若有一边相邻，则需要-2
   return islandCount * 4 - 2 * adjacentCount
}

print(islandPerimeter([[0,1,0,1],
                       [1,1,1,0],
                       [0,1,0,0],
                       [1,1,0,0]]))
