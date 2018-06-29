import Cocoa

// https://leetcode.com/problems/construct-the-rectangle/description/
func constructRectangle(_ area: Int) -> [Int] {
    if area < 0 {
        return []
    }
    
    // 先求平方根
    let result = sqrt(Double(area))
    let intResult = Int(result)
    
    // 刚好等于
    if intResult * intResult == area {
        return [intResult, intResult]
    }
    
    var l = intResult
    
    // 向后找，离平方根越近，差值越小
    while l <= area  {
        let mod = area % l
        
        // l >= w
        if mod == 0 {
            var w = area / l
            if l < w {
                let tmp = w
                w = l
                l = tmp
            }
            
            return [l, w]
        }
        
        l += 1
    }
    
    return []
}

print(constructRectangle(100000))
