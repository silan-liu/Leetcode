// https://leetcode.com/problems/detect-capital/description/
func detectCapitalUse(_ word: String) -> Bool {
    // all uppercase
    // all lowercase
    // first char is uppercase
    
    var index = -1
    enum Type {
        case Unknown
        case Uppercase
        case Lowercase
    }
    
    var type: Type = .Unknown
    
    for w in word {
        index += 1
        
        if index == 0 {
            if w >= "A" && w <= "Z" {
                type = .Uppercase
            } else if w >= "a" && w <= "z" {
                type = .Lowercase
            } else {
                return false
            }
        } else {
            if w >= "A" && w <= "Z" {
                if type == .Uppercase {
                    continue
                } else if type == .Lowercase {
                    return false
                }
            } else if w >= "a" && w <= "z" {
                if type == .Uppercase {
                    if index == 1 {
                        type = .Lowercase
                        continue
                    }
                    
                    return false
                } else if type == .Lowercase {
                    continue
                }
            } else {
                return false
            }
        }
    }
    
    return true
}

print(detectCapitalUse("USAa"))
