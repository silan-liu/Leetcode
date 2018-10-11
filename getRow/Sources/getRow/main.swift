// https://leetcode.com/problems/pascals-triangle-ii/description/
func getRow(_ rowIndex: Int) -> [Int] {
    if rowIndex == 0 {
        return [1]
    } else if rowIndex == 1 {
        return [1, 1]
    } else if rowIndex >= 2 {
        var list = [1,1]
        var i = 2
        while i <= rowIndex {
            var j = 0
            var result = [Int]()
            while j <= rowIndex {
                if j == 0 || j == rowIndex {
                    result.append(1)
                } else {
                    if j - 1 >= 0 && j < list.count {
                        let value = list[j - 1] + list[j]
                        result.append(value)
                    }
                }
                
                j += 1
            }
            
            list = result
            
            i += 1
        }
        
        return list
    } else {
        return [1]
    }
}

print(getRow(9))
