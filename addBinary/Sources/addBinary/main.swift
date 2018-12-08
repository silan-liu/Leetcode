// https://leetcode.com/problems/add-binary/submissions/
func addBinary(_ a: String, _ b: String) -> String {
    let maxLen = max(a.count, b.count)
    
    var array = [Int]()
    var i = 0
    var c = 0
    while i < maxLen {
        var ca = 0
        let j = a.count - i - 1
        if j >= 0 {
            let aIndex = a.index(a.startIndex, offsetBy: j)
            ca = Int(String(a[aIndex]))!
        }
        
        var cb = 0
        let k = b.count - i - 1
        if k >= 0 {
            let bIndex = b.index(b.startIndex, offsetBy: k)
            cb = Int(String(b[bIndex]))!
        }
        
        let tmp = ca + cb + c
        let value = tmp % 2
        c = tmp / 2
        
        array.insert(value, at: 0)
        
        i += 1
    }
    
    if c != 0 {
        array.insert(1, at: 0)
    }
    
    var result = ""
    for c in array {
        result.append(String(c))
    }
    
    return result
}

let a = "111", b = "111"
print(addBinary(a, b))
