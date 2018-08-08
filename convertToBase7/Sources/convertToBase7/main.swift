// https://leetcode.com/problems/base-7/description/
func convertToBase7(_ num: Int) -> String {
    var tmp = num
    var result = ""
    var bits = [Int]()
    
    if num < 0 {
        tmp = -num
        result += "-"
    } else if num == 0 {
        return "0"
    }
    
    while tmp != 0 {
        let mod = tmp % 7
        tmp = tmp / 7

        bits.append(mod)
    }

    for bit in bits.reversed() {
        result.append(String(bit))
    }
    
    return result
}

let num = 0
print(convertToBase7(num))
