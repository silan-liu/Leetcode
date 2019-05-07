
class Solution {
    func allCellsDistOrder(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
        var result = [[Int]]()
        // 最大值 R + C
        var i = 0
        while i <= R + C + 1 {
            result.append([])
            i += 1
        }
        
        return result
    }
}
