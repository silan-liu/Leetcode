// https://leetcode.com/problems/reshape-the-matrix/description/
// 按行遍历，若遍历index是c的倍数，则需新起一行
func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
    let rowCount = nums.count
    if rowCount >= 1 {
        let columnCount = nums[0].count
        
        if rowCount * columnCount != r * c {
            return nums
        }
        
        var index = 0
        var result = [[Int]]()
        
        for row in 0..<rowCount {
            for column in 0..<columnCount {
                var list: [Int]
                
                if index % c == 0 {
                    // 换行
                    list = [Int]()
                    list.append(nums[row][column])
                    
                    result.append(list)
                } else {
                    if var list = result.last {
                        list.append(nums[row][column])
                        
                        result[result.count - 1] = list
                    }
                }
                
                index += 1
            }
        }
        
        return result
    } else {
        return nums
    }
}

let nums =
    [[1,2],
     [3,4]]
let r = 2, c = 4

print(matrixReshape(nums, r, c))
