// https://leetcode.com/problems/valid-boomerang/
class Solution {
    func isBoomerang(_ points: [[Int]]) -> Bool {
        // 不同且不再一条线
        var i = 0
        
        // 前一个斜率
        var preGradient: Float = 0
        
        while i < points.count - 1 {
            let point1 = points[i]
            let point2 = points[i+1]
            
            if point1[0] == point2[0], point1[1] == point2[1] {
                return false
            }
            
            var gradient: Float = 0
            
            if point2[0] - point1[0] == 0 {
                gradient = Float(Int.max)
            } else {
                // 斜率
                gradient = Float((point2[1] - point1[1])) / Float((point2[0] - point1[0]))
            }
            
            if i > 0 && gradient == preGradient {
                return false
            }
            
            preGradient = gradient
            
            i += 1
        }
        
        return true
    }
}

let points = [[0,1],[2,1],[0,0]]
let s = Solution()
print(s.isBoomerang(points))
