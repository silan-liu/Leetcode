// https://leetcode.com/problems/remove-outermost-parentheses
class Solution {
    func removeOuterParentheses(_ S: String) -> String {
        if S.isEmpty {
            return ""
        }
        
        var stack = [Character]()
        var result = ""
        var start = 0
        var end = 0
        
        var i = 0
        for s in S {
            
            if s == "(" {
                stack.append(s)
            } else if s == ")" {
                if stack.count > 0 {
                    stack.removeLast()
                    
                    // valid parenthese string end
                    if stack.count == 0 {
                        end = i
                        
                        if end > start, end < S.count, start >= 0 {
                            let startIndex = S.index(S.startIndex, offsetBy: start)
                            let endIndex = S.index(S.startIndex, offsetBy: end)
                            
                            var str = S[startIndex...endIndex]
                            
                            // 去除头尾
                            str.removeFirst()
                            str.removeLast()
                            
                            result += str
                        }
                        
                        start = i + 1
                        
                    }
                } else {
                    assert(false, "not valid parenthese string!")
                }
            }
            
            i += 1
        }
        
        return result
    }
    
    // faster
    func removeOuterParentheses_2(_ S: String) -> String {
        if S.isEmpty {
            return ""
        }
        
        var stack = [Character]()
        var result = ""
        var tmp = ""
        
        for s in S {
            
            tmp.append(s)
            
            if s == "(" {
                stack.append(s)
            } else if s == ")" {
                if stack.count > 0 {
                    stack.removeLast()
                    
                    // valid parenthese string end
                    if stack.count == 0 {
                        // 去除头尾
                        tmp.removeFirst()
                        tmp.removeLast()
                        
                        result += tmp
                        
                        tmp = ""
                        
                    }
                } else {
                    assert(false, "not valid parenthese string!")
                }
            }
        }
        
        return result
    }
}

let s = Solution()
let S = "()()"
print(s.removeOuterParentheses(S))
print(s.removeOuterParentheses_2(S))
