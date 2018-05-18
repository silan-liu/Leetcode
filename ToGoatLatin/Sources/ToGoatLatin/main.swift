// https://leetcode.com/problems/goat-latin/description/
func toGoatLatin(_ S: String) -> String {
    let words = S.split(separator: " ")
    
    if words.count > 0 {
        var append = "a"
        var result = ""
        var index = 0
        
        for word in words {
            let lowercased = word.lowercased()
            var newWord = ""
            if let first = lowercased.first {
                if first == "a" || first == "e"
                || first == "i" || first == "o" || first == "u"{
                    newWord += word
                } else {
                    let trimmed = word.dropFirst()
                    
                    newWord += trimmed
                    print("trimmed:\(trimmed)")
                    
                    if let first = word.first {
                        newWord += String(first)
                    }
                }
            }
            
            newWord += "ma"
            newWord += append
            result += newWord
            
            if index != words.count - 1 {
                result += " "
            }

            index += 1
            append += "a"
        }
        
        return result
    }
    
    return ""
}

let str = "The quick brown fox jumped over the lazy dog"

print(toGoatLatin(str))
