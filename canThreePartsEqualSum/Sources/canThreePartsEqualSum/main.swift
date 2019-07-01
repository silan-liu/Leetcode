// https://leetcode.com/problems/partition-array-into-three-parts-with-equal-sum
class Solution {
    // 5.81% 
    func canThreePartsEqualSum(_ A: [Int]) -> Bool {
        var sum = 0
        for num in A {
            sum += num
        }
        
        if sum % 3 != 0 {
            return false
        }
        
        var i = 0
        var j = A.count - 1
        
        let avg = sum / 3
        var sum1 = 0
        var sum3 = 0
        
        while i + 1 < j {
            while i < A.count {
                sum1 += A[i]
                
                if sum1 == avg {
                    break
                }
                
                i += 1
            }
            
            if i < A.count {
                
                // 计算第三部分的和
                while i + 1 < j {
                    sum3 += A[j]
                    
                    if sum3 == avg {
                        break
                    }
                    
                    j -= 1
                }
                
                if i + 1 < j {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        
        return false
    }
}

let s = Solution()
let A = [3,3,6,5,-2,2,5,1,-9,4,3]
print(s.canThreePartsEqualSum(A))
