// https://leetcode.com/problems/n-repeated-element-in-size-2n-array/submissions/
class Solution {
    // 38%
    func repeatedNTimes(_ A: [Int]) -> Int {
        var map = [Int: Int]()
        for n in A {
            if let count = map[n] {
                map[n] = count + 1
            } else {
                map[n] = 1
            }
        }
        
        for (key, value) in map {
            if value == A.count / 2 {
                return key
            }
        }
        
        return -1
    }
    
    // 60.56%
    func repeatedNTimes_2(_ A: [Int]) -> Int {
        if A.count == 0 {
            return 0
        }
        
        // 所有数的总和
        var sum1 = 0
        
        // 所有不同数的总和
        var sum2 = 0
        
        var set = Set<Int>()
        
        for n in A {
            if !set.contains(n) {
                sum2 += n
                set.insert(n)
            }
            
            sum1 += n
        }
        
        return (sum1 - sum2) / (A.count / 2 - 1)
    }
    
    // 91.55%
    func repeatedNTimes_3(_ A: [Int]) -> Int {
        var map = [Int: Int]()
        for n in A {
            // 如果有重复，直接返回
            if let _ = map[n] {
                return n
            } else {
                map[n] = 1
            }
        }
        
        return -1
    }
}

let s = Solution()
let A = [5,1,5,2,5,3,5,4]
print(s.repeatedNTimes(A))
print(s.repeatedNTimes_2(A))
print(s.repeatedNTimes_3(A))
