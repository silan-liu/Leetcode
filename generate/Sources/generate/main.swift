// https://leetcode.com/problems/pascals-triangle/description/
func generate(_ numRows: Int) -> [[Int]] {
    var result = [[Int]]()
    
    var i = 0
    var lastRow = [Int]()
    
    while i < numRows {
        var j = 0
        var row = [Int]()
        while j <= i {
            if j == 0 || j == i {
                row.append(1)
            } else {
                let num = lastRow[j - 1] + lastRow[j]
                row.append(num)
            }
            
            j += 1
        }
        
        result.append(row)
        lastRow = row
        
        i += 1
    }
    
    return result
}

print(generate(6))
