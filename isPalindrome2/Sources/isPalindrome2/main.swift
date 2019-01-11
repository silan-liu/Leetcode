// https://leetcode.com/problems/valid-palindrome/submissions/
func isPalindrome(_ s: String) -> Bool {
    let list = Array(s)
    var i = 0
    var j = list.count - 1
    while i <= j {
        let c1 = String(list[i]).lowercased()
        let c2 = String(list[j]).lowercased()
        
        let f1 = isAlphaNumberic(c1)
        let f2 = isAlphaNumberic(c2)
        
        if f1 && f2 {
            if c1 == c2 {
                i += 1
                j -= 1
            } else {
                return false
            }
        } else if !f1 {
            i += 1
        } else {
            j -= 1
        }
    }

    return true
}

func isAlphaNumberic(_ char: String) -> Bool {
    if (char >= "0" && char <= "9") || (char >= "a" && char <= "z") {
        return true
    }

    return false
}

let s = "aab1ba,ac"
print(isPalindrome(s))
