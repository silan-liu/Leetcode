// https://leetcode.com/problems/ugly-number/description/
func isUgly(_ num: Int) -> Bool {
    
    if (num <= 0) {
        return false
    }
    var n = num
    while n != 1 {
        if n % 2 == 0 {
            n = n / 2
        } else if n % 3 == 0 {
            n = n / 3
        } else if n % 5 == 0 {
            n = n / 5
        } else {
            return false
        }
    }
    
    return true
}

print(isUgly(2235453221555465))
