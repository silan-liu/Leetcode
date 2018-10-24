//https://leetcode.com/problems/reverse-vowels-of-a-string/submissions/
// Time Limit Exceeded
func reverseVowels(_ s: String) -> String {
    var vowelList = [Character]()
    for c in s {
        if isVowel(c) {
            vowelList.append(c)
        }
    }
    
    let count = vowelList.count
    var i = 0
    var j = 0
    var result = ""
    while i < s.count {
        let index = s.index(s.startIndex, offsetBy: i)
        let c = s[index]
        if isVowel(c) {
            // 替换
            let replace_index = count - j - 1
            if replace_index >= 0 && replace_index < count {
                let r = vowelList[replace_index]
                result.append(r)
            }
            
            j += 1
        } else {
            result.append(c)
        }
        
        i += 1
    }
    
    return result
}

// Time Limit Exceeded
func reverseVowels_2(_ s: String) -> String {
    var i = 0
    var j = s.count - 1
    var front = -1
    var rear = -1
    
    var result = s
    
    while i < j  {
        while i < j {
            let index = s.index(s.startIndex, offsetBy: i)
            let c = s[index]
            
            if isVowel(c) {
                front = i
                break
            } else {
                i += 1
            }
        }
        
        while i < j {
            let index = s.index(s.startIndex, offsetBy: j)
            let c = s[index]
            
            if isVowel(c) {
                rear = j
                break
            } else {
                j -= 1
            }
        }
        
        if rear != front {
            // 替换
            let front_index = s.index(s.startIndex, offsetBy: front)
            let rear_index = s.index(s.startIndex, offsetBy: rear)
            
            let front_value = String(s[front_index])
            let rear_value = String(s[rear_index])
            
            result.replaceSubrange(front_index...front_index, with: rear_value)
            result.replaceSubrange(rear_index...rear_index, with: front_value)

            i += 1
            j -= 1
        }
    }
    
    return result
}

func reverseVowels_3(_ s: String) -> String {
    var list = Array(s)
    
    var i = 0
    var j = list.count - 1
    while i < j {
        while i < j && !isVowel(list[i]) {
            i += 1
        }
        
        while i < j && !isVowel(list[j]) {
            j -= 1
        }
        
        if (i != j) {
            let a = list[i]
            let b = list[j]
            
            list[i] = b
            list[j] = a
            
            i += 1
            j -= 1
        }
    }
    
    let result = String(list)
    return result
}

func isVowel(_ c: Character) -> Bool {
    let str = String(c).lowercased()
    if str == "a" || str == "o" || str == "e" || str == "i" || str == "u" {
        return true
    }
    
    return false
}

let string = "A manfdsjkfdjsfldsjaoifsdapciobfoaoaiauifdkjpouiaiaoaudofdiaoaocisoqdfgadsioaiudkfjdioaoiso"


print(reverseVowels(string))

print(reverseVowels_2(string))

print(reverseVowels_3(string))


