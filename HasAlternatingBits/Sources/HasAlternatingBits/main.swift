
func hasAlternatingBits(_ n: Int) -> Bool {
    var lastBit = n & 0x1
    var tmp = n >> 1
    while tmp > 0 {
        let bit = tmp & 0x1
        
        if lastBit == bit {
            return false
        }
        
        lastBit = bit
        tmp = tmp >> 1
    }
    
    return true
}

print(hasAlternatingBits(5))
