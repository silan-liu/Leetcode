// https://leetcode.com/problems/power-of-two/description/
func isPowerOfTwo(_ n: Int) -> Bool {
    if n == 0 {
        return false
    }
    
    if n == 1 {
        return true
    }
    
    var tmp = n
    while tmp != 1 {
        let mod = tmp % 2
        
        if mod != 0 {
            return false
        }
        
        tmp = tmp / 2
    }
    
    return true
}


print(isPowerOfTwo(1024))
