// https://leetcode.com/problems/valid-perfect-square/
func isPerfectSquare(_ num: Int) -> Bool {
    var i = 1
    while i <= num / 2 {
        let value = i * i
        if value == num {
            return true
        } else if value > num {
            return false
        }
        
        i += 1
    }
    
    return false
 }
 
 // 二分法
 func isPerfectSquare_2(_ num: Int) -> Bool {
    if num == 0 || num == 1 {
        return true
    }
    
    var low = 0
    var high = num / 2
    var mid = 0
    
    while low <= high {
        mid = (low + high) / 2
        
        let value = mid * mid
        if value == num {
            return true
        } else if value > num {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return false
 }
 
 print(isPerfectSquare(2147483647))
 print(isPerfectSquare_2(2147483647))
