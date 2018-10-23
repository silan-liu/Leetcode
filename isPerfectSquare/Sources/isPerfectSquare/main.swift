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
 
 print(isPerfectSquare(4000000))
