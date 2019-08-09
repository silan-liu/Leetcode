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
    
    // 因为 (x+y) % 60 = 0, x % 60 = 60 - y % 60，而 x % 60 取值范围为 [0,59]，而 60 - y % 60 的取值范围为[0,60]，所以为了两者范围相同，需要 % 60，即 (60 - y % 60) % 60。
    // 用数组记录 t%60 出现的次数，比如遇到40, t[40] = 1，表示出现了一次，遇到 100, t[40] = 2
    // 那么当 20 匹配对数时，取t[40]的个数即可。
    // 87.80%
    func numPairsDivisibleBy60_2(_ time: [Int]) -> Int {
        var count = 0
        var array = [Int]()
        
        var i = 0
        while i < 60 {
            array.append(0)
            i += 1
        }
        
        for t in time {
            count += array[(60 - t % 60) % 60]
            
            // 次数加1
            array[t % 60] += 1
        }
        
        return count
    }
}

let s = Solution()
let time = [60,60,60]
print(s.numPairsDivisibleBy60(time))
