// https://leetcode.com/problems/valid-parentheses/submissions/
func isValid(_ s: String) -> Bool {
    if s.count == 0 {
        return true
    }
    
    var stack = [Int]()
    var map = ["(":1, ")":2, "{":3, "}":4, "[":5, "]":6]
    
    // 假定1-(, 2-), 3-{, 4-}, 5-[, 6-]
    for c in s {
        if c == "(" || c == "{" || c == "[" {
            stack.append(map[String(c)]!)
        } else if c == ")" || c == "}" || c == "]" {
            // 取出栈顶值
            if stack.count > 0 {
                let v1 = stack.last!
                let v2 = map[String(c)]
                
                if v1 + 1 == v2 {
                    stack.removeLast()
                } else {
                    return false
                }
            } else {
                return false
            }
        }
    }
    
    if stack.count == 0 {
        return true
    }
    
    return false
 }

 let str = "()[]()"
 print(isValid(str))
