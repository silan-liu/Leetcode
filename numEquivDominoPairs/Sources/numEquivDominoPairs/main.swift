// https://leetcode.com/problems/number-of-equivalent-domino-pairs/
class Solution {
    // 80.00%
    func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
        var map = [String: Int]()
        
        for domino in dominoes {
            if domino.count == 2 {
                let a = domino[0]
                let b = domino[1]
                
                let key = "\(min(a, b))" + "-" + "\(max(a, b))"
                if let count = map[key] {
                    map[key] = count + 1
                } else {
                    map[key] = 1
                }
            }
        }
                
        var result = 0
        for (_, value) in map {
            if value > 1 {
                // Cn2
                result += (value * (value - 1)) / 2
            }
        }
        
        return result
    }
}

let s = Solution()
let dominoes = [[1,2],[2,1],[3,4],[4,3]]
print(s.numEquivDominoPairs(dominoes))
