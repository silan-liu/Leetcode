// https://leetcode.com/problems/repeated-string-match/submissions/
class Solution {
    func repeatedStringMatch(_ A: String, _ B: String) -> Int {
        let listA = Array(A)
        let listB = Array(B)
        
        // 先在A中找到B开头的字母
        var i = 0

        while i < listA.count {
            if listA[i] == listB[0] {
                
                var j = 0
                var k = i
                var count = 1
                var flag = true
                
                while j < listB.count {
                    if listB[j] != listA[k] {
                        flag = false
                        break
                    } else {
                        // 从头开始
                        if k == listA.count - 1 {
                            // 如果b不是最后一个字符
                            if j != listB.count - 1 {
                                k = 0
                                count += 1
                            }
                        } else {
                            k += 1
                        }
                    }
                    
                    j += 1
                }
                
                if flag {
                    return count
                }
            }

            i += 1
        }
        
        return -1
    }
}

let A = "aaac", B = "aacaa"
let solution = Solution()
print(solution.repeatedStringMatch(A, B))
