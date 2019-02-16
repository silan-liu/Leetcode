// https://leetcode.com/problems/max-increase-to-keep-city-skyline/submissions/
func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
    if grid.count == 0 {
        return 0
    }

    let rowCount = grid.count
    let colCount = grid[0].count

    // 计算水平/竖直方向最大值
    var rows = [Int]()
    var cols = [Int]()
    var i = 0
    var j = 0

    while i < rowCount {
        j = 0
        var maxCol = Int.min
        var maxRow = Int.min

        while j < colCount {
            if grid[i][j] > maxRow {
                maxRow = grid[i][j]
            }

            if grid[j][i] > maxCol {
                maxCol = grid[j][i]
            }

            j += 1
        }

        rows.append(maxRow)
        cols.append(maxCol)

        i += 1
    }

    print(rows)
    print(cols)
    

    var result = 0

    i = 0
    while i < rowCount {
        j = 0
        while j < colCount {
            let height = grid[i][j]
 
            if height != rows[i] && height != cols[j] {
                let minHeight = min(rows[i], cols[j])
                result += minHeight - height
            }

            j += 1
        }

        i += 1
    }

    return result
}

let grid = [
    [84,25,79],
    [24,22,26],
    [87,93,87]]

print(maxIncreaseKeepingSkyline(grid))
