// https://leetcode.com/problems/number-of-segments-in-a-string/submissions/
func countSegments(_ s: String) -> Int {
    let substring = s.split(separator: " ")
    return substring.count
}

// 逐个遍历
func countSegments_2(_ s: String) -> Int {
    var count = 0
    var flag = false
    var i = 0
    for c in s {
        if c == " " {
            if flag {
                count += 1
                flag = false
            }
        } else {
            flag = true
            
            if i == s.count - 1 {
                count += 1
            }
        }
        
        i += 1
    }
    
    return count
}

let s = "hello, world kkk kk   what, m"
print(countSegments(s))
print(countSegments_2(s))
