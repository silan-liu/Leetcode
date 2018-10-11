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
            var j = i - 1
            while j >= 1  {
                list[j] = list[j - 1] + list[j]

                j -= 1
            }

            list.append(1)
            
            i += 1
        }
        
        return list
    } else {
        return [1]
    }
}

print(getRow(5))
