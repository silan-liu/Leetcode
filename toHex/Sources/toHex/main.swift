import Foundation

func toHex(_ num: Int) -> String {
    var result = ""
    var map = [10:"a", 11:"b", 12:"c", 13:"d", 14:"e", 15:"f"]
    
    let base = 16
    var tmp = num
    
    if tmp < 0 {
        tmp += 2 << 31
    } else if tmp == 0 {
        return "0"
    }
    
    while tmp != 0 {
        let mod = tmp % base
        tmp = tmp / base
        
        if mod < 10 {
            result = String(mod) + result
        } else {
            if let value = map[mod] {
                result = value + result
            }
        }
    }
    
    return result
}

let num = -1
print(toHex(num))
