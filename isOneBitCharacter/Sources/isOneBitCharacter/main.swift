// https://leetcode.com/problems/1-bit-and-2-bit-characters/description/
func isOneBitCharacter(_ bits: [Int]) -> Bool {
    if let last = bits.last, last != 0 {
        return false
    }
    
    // 11, 10, 0
    var tmp = bits
    
    while tmp.count > 1 {
        let bit = tmp[0]
        
        if bit == 1 {
            // remove cur & next
            tmp.remove(at: 0)
            
            tmp.remove(at: 0)
        } else if bit == 0 {
            tmp.remove(at: 0)
        }
    }
    
    if tmp.count == 1, tmp[0] == 0 {
        return true
    }
    
    return false
}

let bits = [1, 1, 0, 0]
print(isOneBitCharacter(bits))
