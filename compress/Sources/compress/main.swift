// https://leetcode.com/problems/string-compression/submissions/
func compress(_ chars: inout [Character]) -> Int {
    if chars.count == 0 {
        return 0
    }
    
    var lastChar = chars[0]
    var i = 1
    var count = 1
    var result = [Character]()
    result.append(lastChar)
    
    while i < chars.count {
        if lastChar == chars[i] {
            count += 1
            
            if i == chars.count - 1, count != 1 {
                let list = Array(String(count))
                result.append(contentsOf: list)
            }
        } else {
            if count != 1 {
                let list = Array(String(count))
                result.append(contentsOf: list)
            }
            
            result.append(chars[i])
            
            count = 1
            lastChar = chars[i]
        }
        
        i += 1
    }
    
    chars = result
    print(result)
    
    return chars.count
}

func compress_2(_ chars: inout [Character]) -> Int {
    if chars.count == 0 {
        return 0
    }
    
    var lastChar = chars[0]
    var i = 1
    var count = 1
    
    // 表示待更新的位置
    var index = 1

    while i < chars.count {
   
        if lastChar == chars[i] {
            count += 1
            
            // 跟上个数
            if i == chars.count - 1, count != 1 {
                let list = Array(String(count))
                for value in list {
                    chars[index] = value
                    index += 1
                }
            }
        } else {
            lastChar = chars[i]

            if count != 1 {
                let list = Array(String(count))
                for value in list {
                    chars[index] = value
                    index += 1
                }
            }
            
            chars[index] = lastChar
            index += 1
            
            count = 1
        }
        
        i += 1
    }
    
    print(chars)
    
    return index
}

var chars = [Character("a"),Character("a"), Character("b"),Character("b"),Character("b"),Character("b"),Character("b"),Character("b"),Character("b"),Character("b"),Character("b"),Character("b"),Character("b"),Character("b"),Character("b"),Character("c"),Character("c"),Character("d")]
//print(compress(&chars))
print(compress_2(&chars))
