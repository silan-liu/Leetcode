// https://leetcode.com/problems/pairs-of-songs-with-total-durations-divisible-by-60/
class Solution {
    // 暴力解法，超时
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var count = 0
        var i = 0
        while i < time.count {
            var j = i + 1
            while j < time.count {
                if (time[i] + time[j]) % 60 == 0 {
                    count += 1
                }
                
                j += 1
            }
            
            i += 1
        }
        
        return count
    }
}

let s = Solution()
let time = [60,60,60]
print(s.numPairsDivisibleBy60(time))
