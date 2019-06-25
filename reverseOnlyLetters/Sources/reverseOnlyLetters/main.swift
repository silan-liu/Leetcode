// https://leetcode.com/problems/reverse-only-letters/submissions/
class Solution {
    // 90.20%
    func reverseOnlyLetters(_ S: String) -> String {
        var list = Array(S)
        var i = 0
        var j = list.count - 1
        
        while i <= j {
            while i < list.count, !list[i].isLetter {
                i += 1
            }
            
            while j >= 0, !list[j].isLetter {
                j -= 1
            }
            
            if i < j, i < list.count, j >= 0 {
                // swap
                let tmp = list[i]
                list[i] = list[j]
                list[j] = tmp
                
                i += 1
                j -= 1
            } else {
                break
            }
        }
        
        return String(list)
    }
    
    // 98.04%
    func reverseOnlyLetters2(_ S: String) -> String {
        var list = Array(S)
        var i = 0
        var j = list.count - 1
        var result = ""
        
        while i < list.count {
            if list[i].isLetter {
                while !list[j].isLetter {
                    j -= 1
                }
                
                result += String(list[j])
                j -= 1
            } else {
                result += String(list[i])
            }
            
            i += 1
        }
        
        return result
    }
    
    // 45.10%
    func reverseOnlyLetters3(_ S: String) -> String {
        var stack = [Character]()
        var list = Array(S)

        var i = 0

        while i < list.count {
            if list[i].isLetter {
                stack.append(list[i])
            }
            
            i += 1
        }
        
        var result = ""
        i = 0
        while i < list.count {
            if list[i].isLetter {
                result += String(stack.last!)
                stack.removeLast()
            } else {
                result += String(list[i])
            }
            
            i += 1
        }
        
        return result
    }
}

let s = Solution()
let S = "dd-aco0fs!f-0kk"

print(s.reverseOnlyLetters(S))
print(s.reverseOnlyLetters2(S))
print(s.reverseOnlyLetters3(S))
