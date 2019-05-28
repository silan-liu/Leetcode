// https://leetcode.com/problems/height-checker/submissions/
class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        let sortedHeights = heights.sorted()
        var i = 0
        var count = 0
        while i < heights.count {
            if sortedHeights[i] != heights[i] {
                count += 1
            }
            
            i += 1
        }
        
        return count
    }
}


let height = [1,1,4,2,1,3]
let s = Solution()
print(s.heightChecker(height))
