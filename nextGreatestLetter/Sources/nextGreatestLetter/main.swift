// https://leetcode.com/problems/find-smallest-letter-greater-than-target/description/
// 55.56%
func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    var minDiff = Int.max
    let targetValue = toInt(target)
    var result: Character = Character("a")
    
    for letter in letters {
        let letterValue = toInt(letter)
        var diff = Int.max
        
        if letterValue < targetValue {
            diff = letterValue + 26 - targetValue
        } else if letterValue > targetValue {
            diff = letterValue - targetValue
        }
        
        if diff < minDiff {
            result = letter
            minDiff = diff
        }
    }
    
    return result
}

// letters 已排序
// 93.75%
func nextGreatestLetter2(_ letters: [Character], _ target: Character) -> Character {
    for letter in letters {
        if letter > target {
            return letter
        }
    }
    
    return letters[0]
}

func toInt(_ c: Character) -> Int
{
    var intFromCharacter:Int = 0
    for scalar in String(c).unicodeScalars
    {
        intFromCharacter = Int(scalar.value)
    }
    return intFromCharacter
}

let letters = [Character("c"), Character("f"), Character("j")]
let target = Character("f")
print(nextGreatestLetter(letters, target))
print(nextGreatestLetter2(letters, target))
