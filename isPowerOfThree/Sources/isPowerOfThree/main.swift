// https://leetcode.com/problems/power-of-three/description/
func isPowerOfThree(_ n: Int) -> Bool {
    if n == 0 {
        return false
    }
    
    if n == 1 {
        return true
    }
    
    var tmp = n
    while tmp != 1 {
        if tmp % 3 != 0 {
            return false
        }
        
        tmp = tmp / 3
    }
    
    return true
}

let n = 81
print(isPowerOfThree(n))
