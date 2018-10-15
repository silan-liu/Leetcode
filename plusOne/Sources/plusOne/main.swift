// https://leetcode.com/problems/plus-one/description/
func plusOne(_ digits: [Int]) -> [Int] {
    var c = 0
    var result = digits
    
    var i = result.count - 1
    while i >= 0 {
        var value = digits[i]
        var newValue = value + c
        if i == result.count - 1 {
            newValue = value + 1
        }
        
        value = newValue % 10
        c = newValue / 10
        
        result[i] = value
        i -= 1
    }
    
    if c > 0 {
        result.insert(c, at: 0)
    }
    
    return result
}


let digits = [0,0,9]
print(plusOne(digits))
