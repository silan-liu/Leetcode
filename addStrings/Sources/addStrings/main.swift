// https://leetcode.com/problems/add-strings/description/
func addStrings(_ num1: String, _ num2: String) -> String {
    var result = ""
    
    let len1 = num1.count
    let len2 = num2.count
    let len = max(len1, len2)
    
    var i = 1
    var c = 0
    while len - i >= 0  {
        
        var sum = 0
        if len1 - i >= 0 {
            let index1 = num1.index(num1.startIndex, offsetBy: len1 - i)
            let n1 = num1[index1]
            sum += Int(String(n1))!

        }
        
        if len2 - i >= 0 {
            let index2 = num2.index(num2.startIndex, offsetBy: len2 - i)
            let n2 = num2[index2]
            sum += Int(String(n2))!
        }
        
        sum += c
        c = sum / 10
        
        // 转成成asiic码
        let value = sum % 10 + 48
        let char = Character(UnicodeScalar(value)!)
        result.insert(char, at: result.startIndex)
        
        i += 1
    }

    if c > 0 {
        let char = Character(UnicodeScalar(c + 48)!)
        result.insert(char, at: result.startIndex)
    }
    
    return result
}

let num1 = "892766389397738293329901098833"
let num2 = "8847379038274663873667186636838736"
print(addStrings(num1, num2))
