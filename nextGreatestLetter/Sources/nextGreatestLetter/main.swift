
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
}

func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    var minDiff = Int.max
    let targetValue = target.toInt()
    var result: Character = Character("")
    
    for letter in letters {
        let letterValue = letter.toInt()
        var diff = 0
        
        if letterValue <= targetValue {
            diff = letterValue + 26 - targetValue
        } else {
            diff = targetValue - letterValue
        }
        
        if diff < minDiff {
            result = letter
            minDiff = diff
        }
    }
    
    return result
}
