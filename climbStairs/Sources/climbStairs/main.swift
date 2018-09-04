 // f(n) = f(n-1) + f(n-2)
 func climbStairs(_ n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    
    if n == 2 {
        return 2
    }
    
    if n == 3 {
        return 3
    }
    
    var a = 2
    var b = 3
    
    var i = 4
    while i < n {
        let tmp = a + b
        a = b
        b = tmp
        
        i += 1
    }
    
    return a + b
 }
 
 let n = 5
 print(climbStairs(n))
