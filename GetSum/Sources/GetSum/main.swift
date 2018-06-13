// 适用于都是正数
func getSum(_ a: Int, _ b: Int) -> Int {
    var a1 = a
    var b1 = b
    
    // 进位
    var flag = 0
    
    if a1 == 0 {
        return b
    }
    
    if b1 == 0 {
        return a
    }
    
    var multiplier = 1
    var result = 0
    
    while a1 != 0 || b1 != 0 || flag == 1 {
        let lastA = a1 & 1
        let lastB = b1 & 1
        
        let total = lastB + lastA + flag
        flag = total / 2
        
        let bit = total % 2
        result += multiplier * bit
        multiplier *= 2
        
        a1 >>= 1
        b1 >>= 1
    }

    return result
}

print(getSum(10000000222, 1000000022))
