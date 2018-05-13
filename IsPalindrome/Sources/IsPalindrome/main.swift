// https://leetcode.com/problems/palindrome-number/description/
func isPalindrome(_ x: Int) -> Bool {
    if (x < 0) {
        return false
    }

    var tmp = x
    var list = [Int]()

    while tmp != 0 {
        let last = tmp % 10
        list.append(last)
        tmp = tmp / 10    
    }

    var index = 0
    var count = list.count
    while index < count {
        let a = list[index]
        let b = list[count - index - 1]

        if (a != b) {
            return false
        }

        index += 1
    }

    return true
}

print("\(isPalindrome(-121))")
