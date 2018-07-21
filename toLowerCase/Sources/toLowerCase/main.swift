// https://leetcode.com/problems/to-lower-case/description/
func toLowerCase(_ str: String) -> String {
    var result = ""
    for c in str {
        result.append(c.lowercase())
    }
    
    return result
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

print(toLowerCase("HEFlo"))
