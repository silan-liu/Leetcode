// https://leetcode.com/problems/valid-palindrome-ii/submissions/
func validPalindrome(_ s: String) -> Bool {
    let list = Array(s)
    var i = 0
    var j = list.count - 1

    while i <= j {
        if list[i] != list[j] {
            // 删除i或者j
            if isValid(list, i + 1, j) || isValid(list, i, j - 1) {
                return true
            } else {
                return false
            }
            
        } else {
            i += 1
            j -= 1
        }
    }
    
    return true
}

// 比较头从i开始，尾从j开始，是否为回文。
func isValid(_ list: Array<Character>, _ i: Int, _ j: Int) -> Bool {
    var begin = i
    var end = j
    
    if i >= 0, i <= j, j < list.count {
        while begin <= end {
            if list[begin] != list[end] {
                return false
            }
            
            begin += 1
            end -= 1
        }
        
        return true
    }
    
    return false
}

let s = "abacccaa"
print(validPalindrome(s))
