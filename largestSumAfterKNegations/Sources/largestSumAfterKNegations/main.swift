// https://leetcode.com/problems/maximize-sum-of-array-after-k-negations
class Solution {
    func largestSumAfterKNegations(_ A: [Int], _ K: Int) -> Int {
        // 存负数
        var negArray = [Int]()
        
        // 存正数
        var posArray = [Int]()
        var sum = 0
        
        for a in A {
            sum += a
            
            if a <= 0 {
                negArray.append(a)
            } else {
                posArray.append(a)
            }
        }
        
        // 排序
        negArray = negArray.sorted()
        posArray = posArray.sorted()
        
        // 需要考虑无负数的情况
        if negArray.count == 0, posArray.count > 0 {
            // 反转 2 次，抵消
            if K % 2 == 0 {
                return sum
            } else {
                return sum - 2 * posArray[0]
            }
        } else {
            // 如果 K 大于负数的个数，就需要到处理正数，优先把正数反转 2 次，即保持不变
            if K > negArray.count {
                let leftCount = K - negArray.count
                
                var count = negArray.count
                
                // 奇数，那么对负数的操作需要-1次，如果是偶数，可以对负数全部操作。
                if leftCount % 2 == 1 {
                    count -= 1
                }
                
                var i = 0
                while i < count {
                    sum -= 2 * negArray[i]
                    i += 1
                }
            } else {
                // 负数变正数
                var i = 0
                while i < K {
                    sum -= 2 * negArray[i]
                    i += 1
                }
            }
        }
        
        return sum
    }
}

let s = Solution()
let A = [8,-7,-3,-9,1,9,-6,-9,3]
let K = 8
// 53?
print(s.largestSumAfterKNegations(A, K))
