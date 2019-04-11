class Solution {
    // 超时
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        var i = 0
        var j = 0
        var result = [Int]()
        
        while i < T.count {
            j = i
            
            // 找到第一个比它大的数
            while j < T.count, T[j] <= T[i] {
                j += 1
            }
            
            if j != T.count {
                result.append(j - i)
            } else {
                result.append(0)
            }
            
            i += 1
        }
        
        return result
    }
}

let s = Solution()
let T = [73, 74, 75, 71, 69, 72, 76, 73, 75, 89, 21, 22,90, 112,99,33,444]
print(s.dailyTemperatures(T))
