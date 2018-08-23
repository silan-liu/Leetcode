// https://leetcode.com/problems/binary-gap/description/
func binaryGap(_ N: Int) -> Int {
    var value = N
    var binaryList = [Int]()
    while value != 0 {
        let bit = value & 0x1
        binaryList.insert(bit, at: 0)
        
        value >>= 1
    }
    
    var last = -1
    
    var i = 0
    var maxDistance = 0
    
    while i < binaryList.count {
        if binaryList[i] == 1 {
            if last != -1 {
                maxDistance = max(maxDistance, i - last)
            }
            
            last = i
        }
        i += 1
    }
    
    return maxDistance
}

print(binaryGap(15))
