// https://leetcode.com/problems/happy-number/description/
func isHappy(_ n: Int) -> Bool {
    if n <= 0 {
        return false
    }
    
    // 如果无限循环，会有重复的数，比如n=2
    // 4,16,37,58,89,145,42,20,4
    var set = Set<Int>()
    var result = caculateSquares(n)
    while result != 1 {
        
        print(result)
        if set.contains(result) {
            return false
        }
        
        set.insert(result)
        result = caculateSquares(result)
    }
    
    return true
}

func caculateSquares(_ n: Int) -> Int {
    var tmp = n
    var result = 0
    while tmp > 0 {
        let d = tmp % 10
        tmp = tmp / 10
        
        result += d * d
    }
    
    return result
}

let n = 2
print(isHappy(n))
