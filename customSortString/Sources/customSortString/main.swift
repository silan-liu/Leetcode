// https://leetcode.com/problems/custom-sort-string/submissions/
class Solution {
    func customSortString(_ S: String, _ T: String) -> String {
        // 记录字符的index
        var map = [Character: Int]()

        var i = 0
        while i < S.count {
            
            let index = S.index(S.startIndex, offsetBy: i)
            let char = S[index]
            
            map[char] = i
            
            i += 1
        }
        
        // 存在的字符
        var existCharList = [Character]()
        
        // 剩余的字符
        var leftCharList = [Character]()
        
        i = 0
        while i < T.count {
            
            let index = T.index(S.startIndex, offsetBy: i)
            let char = T[index]
            
            if let order = map[char] {
                // 找到合适的位置
                var j = existCharList.count - 1
                while j >= 0, map[existCharList[j]]! >= order {
                    j -= 1
                }
                
                existCharList.insert(char, at: j + 1)
                
            } else {
                leftCharList.append(char)
            }
            
            i += 1
        }
        
        let list = existCharList + leftCharList
        return String(list)
    }
    
    func customSortString_2(_ S: String, _ T: String) -> String {
        // 记录字符的index
        var map = [Character: Int]()
        var orderMap = [Int: Character]()
        
        var i = 0
        while i < S.count {
            
            let index = S.index(S.startIndex, offsetBy: i)
            let char = S[index]
            
            map[char] = i
            orderMap[i] = char
            
            i += 1
        }
        
        // 存在的字符
        var existCharList = [Character]()
        
        // 剩余的字符
        var leftCharList = [Character]()
        
        // 存在字符的order
        var existCharOrders = [Int]()
        
        i = 0
        while i < T.count {
            
            let index = T.index(S.startIndex, offsetBy: i)
            let char = T[index]
            
            if let order = map[char] {
                existCharList.append(char)
                existCharOrders.append(order)
            } else {
                leftCharList.append(char)
            }
            
            i += 1
        }
        
        var result = [Character]()
        
        // 按位置大小排序
        existCharOrders.sort()
        
        for order in existCharOrders {
            if let char = orderMap[order] {
                result.append(char)
            }
        }
        
        result.append(contentsOf: leftCharList)
        
        return String(result)
    }
    
    func customSortString_3(_ S: String, _ T: String) -> String {
        // 反向思维
        var count = [Int]()
        var result = [Character]()
        
        var i = 0
        while i < 26 {
            count.insert(0, at: i)
            i += 1
        }
        
        for char in T {
            count[char.toInt() - 97] += 1
        }
        
        // 遍历s
        for char in S {
            while count[char.toInt() - 97] > 0 {
                count[char.toInt() - 97] -= 1
                result.append(char)
            }
        }
        
        // 遍历count
        i = 0
        while i < 26 {
            while count[i] > 0 {
                count[i] -= 1
                result.append(Character(UnicodeScalar(i + 97)!))
            }
            
            i += 1
        }

        return String(result)
    }
}

extension Character
{
    func toInt() -> Int
    {
        var intFromCharacter:Int = 0
        for scalar in String(self).unicodeScalars
        {
            intFromCharacter = Int(scalar.value)
        }
        return intFromCharacter
    }
    
    func lowercase() -> Character {
        let int = toInt()
        if int >= 65 && int <= 90 {
            return Character(UnicodeScalar(int + 32)!)
        }
        
        return self
    }
}


let S = "cba", T = "abcd"
let s = Solution()
print(s.customSortString(S, T))
print(s.customSortString_2(S, T))
print(s.customSortString_3(S, T))
