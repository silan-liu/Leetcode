// https://leetcode.com/problems/moving-stones-until-consecutive/submissions/
class Solution {
    // 100.00%
    func numMovesStones(_ a: Int, _ b: Int, _ c: Int) -> [Int] {
        let sorted = [a, b, c].sorted()
        
        // 最小值
        let x = sorted[0]
        
        // 最大值
        let z = sorted[2]
        
        // 中间值
        let y = sorted[1]
        
        // 空位数
        let d1 = y - x - 1
        let d2 = z - y - 1
        
        // 连续
        if d1 == 0 && d2 == 0 {
            return [0, 0]
        } else if d1 == 0 && d2 >= 1 {
            // 两个位置相邻，另一个相隔 >= 1
            return [1, d2]
        } else if d2 == 0 && d1 >= 1 {
            // 两个位置相邻，另一个相隔 >= 1
            return [1, d1]
        } else if d1 == 1 {
            // 两个位置相隔 1
            return [1, 1 + d2]
        } else if d2 == 1 {
            // 两个位置相隔 1
            return [1, 1 + d1]
        } else if d1 >= 2 && d2 >= 2 {
            // 位置相隔 >= 2
            return [2, d1 + d2]
        }
        
        return [0, 0]
    }
    
    // 68.75%，简化版判断
    func numMovesStones2(_ a: Int, _ b: Int, _ c: Int) -> [Int] {
        let sorted = [a, b, c].sorted()
        
        // 最小值
        let x = sorted[0]
        
        // 最大值
        let z = sorted[2]
        
        // 中间值
        let y = sorted[1]
        
        // 空位数
        let d1 = y - x - 1
        let d2 = z - y - 1
        
        // 连续
        if d1 == 0 && d2 == 0 {
            return [0, 0]
        } else if d1 >= 2 && d2 >= 2 {
            // 位置相隔 >= 2
            return [2, d1 + d2]
        } else {
            return [1, d1 + d2]
        }
    }
}

let s = Solution()
let a = 2, b = 3, c = 5
print(s.numMovesStones(a, b, c))
print(s.numMovesStones2(a, b, c))
