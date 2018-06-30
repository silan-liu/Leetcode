// https://leetcode.com/problems/flood-fill/description/
func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    var result = image
    let rowCount = image.count
    if rowCount > 0 {
        let colCount = image[0].count
        
        if sr >= 0 && sr <= rowCount && sc >= 0 && sc < colCount {
            let color = image[sr][sc]
            
            // 如果颜色跟新值一样，则不用处理
            if color == newColor {
                return result
            }
            
            recursive(&result, sr, sc, newColor, color)
        }
    }
    
    return result
}

func recursive(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int, _ color: Int) {
    let rowCount = image.count
    if rowCount > 0 {
        let colCount = image[0].count
        
        if sr >= 0 && sr < rowCount && sc >= 0 && sc < colCount && image[sr][sc] == color {
            image[sr][sc] = newColor
            
            // 上下左右
            // 下
            recursive(&image, sr + 1, sc, newColor, color)
            
            // 上
            recursive(&image, sr - 1, sc, newColor, color)
            
            // 左
            recursive(&image, sr, sc - 1, newColor, color)

            // 右
            recursive(&image, sr, sc + 1, newColor, color)
        }
    }
}

let image = [[0,0,0],[0,1,1]]
let sr = 1, sc = 1, newColor = 1

print(floodFill(image, sr, sc, newColor))
