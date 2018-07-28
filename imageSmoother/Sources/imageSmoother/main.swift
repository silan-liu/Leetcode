// https://leetcode.com/problems/image-smoother/description/
func imageSmoother(_ M: [[Int]]) -> [[Int]] {
    var result = [[Int]]()
    let rowCount = M.count
    if rowCount > 0 {
        let colCount = M[0].count
        var m = 0
        
        while m < rowCount {
            var n = 0
            var list = [Int]()
            while n < colCount {
                let value = average(M, m, n)
                list.append(value)
                
                n += 1
            }
            
            result.append(list)
            
            m += 1
        }
    }
    
    return result
}

func average(_ M: [[Int]], _ i: Int, _ j: Int) -> Int {
    let rowCount = M.count
    if rowCount > 0 {
        let colCount = M[0].count
        
        if i < rowCount && j < colCount {
            
            var m = 0
            var n = 0
            
            var count = 1
            var sum = M[i][j]
            
            // 正上方
            m = i - 1
            n = j
            if m >= 0 {
                sum += M[m][n]
                count += 1
            }
            
            // 正下方
            m = i + 1
            n = j
            if m < rowCount {
                sum += M[m][n]
                count += 1
            }
            
            // 正左
            m = i
            n = j - 1
            if n >= 0 {
                sum += M[m][n]
                count += 1
            }
            
            // 正右
            m = i
            n = j + 1
            if n < colCount {
                sum += M[m][n]
                count += 1
            }
            
            // 左上
            m = i - 1
            n = j - 1
            if m >= 0 && n >= 0 {
                sum += M[m][n]
                count += 1
            }
            
            // 右上
            m = i - 1
            n = j + 1
            if m >= 0 && n < colCount {
                sum += M[m][n]
                count += 1
            }
            
            // 左下
            m = i + 1
            n = j - 1
            if m < rowCount && n >= 0 {
                sum += M[m][n]
                count += 1
            }
            
            // 右下
            m = i + 1
            n = j + 1
            if m < rowCount && n < colCount {
                sum += M[m][n]
                count += 1
            }
            
            if count != 0 {
                print(sum, count)
                return (sum / count)
            }
        }
    }
    
    return 0
}
let M = [[1,1,1],
         [1,0,1],
         [1,1,1]]

print(imageSmoother(M))
