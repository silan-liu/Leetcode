// https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/submissions/
class Solution {
    func minAddToMakeValid(_ S: String) -> Int {
        if S.isEmpty {
            return 0
        }

        var stack = [Character]()
        for s in S {
            if s == "(" {
                stack.append(s)
            } else if s == ")" {
                if stack.count > 0 {
                    let top = stack.last!
                    // 匹配
                    if top == "(" {
                        stack.removeLast()
                    } else {
                        stack.append(s)
                    }
                } else {
                    stack.append(s)
                }
            }
        }

        return stack.count
    }
}

let s = Solution()
let S = "()))))()))"
print(s.minAddToMakeValid(S))