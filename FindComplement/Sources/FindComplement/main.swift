 
 // https://leetcode.com/problems/number-complement/description/
 
 func findComplement(_ num: Int) -> Int {
    print(~0)
    var tmp = num
    var multiple = 1
    var result = 0
    
    while tmp != 0 {
        // 将最后一位取反
        let lastBit = (tmp & 0x1) ^ 1
        result = lastBit * multiple + result
        multiple *= 2
        
        tmp >>= 1
    }
    
    return result
 }
 
 func findComplement_2(_ num: Int) -> Int {
    var a = 1
    while a <= num {
        a <<= 1
    }
    
    // a - 1将num所在的bit对应的位置都变成1
    // 如num=8，bit表示1000，则a为10000，a-1为01111
    return (a - 1) ^ num
 }
 
 
 print(findComplement(8))
 print(findComplement_2(8))

