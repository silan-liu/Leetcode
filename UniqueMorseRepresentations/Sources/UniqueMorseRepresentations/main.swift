class Solution {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        let map = ["a": ".-", "b": "-...", "c": "-.-.", "d": "-..","e": ".", "f": "..-.", "g": "--.","h": "....", "i": "..", "j": ".---", "k": "-.-", "l": ".-..", "m": "--", "n": "-.", "o": "---","p": ".--.", "q": "--.-", "r": ".-.", "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--", "x": "-..-", "y": "-.--", "z": "--.."]
        var list = [String: Int]()

        for string in words {
            var transformedString = ""
            for s in string {
                if let transform = map[String(s)] {
                     transformedString = transformedString + transform
                }
            }

            if !transformedString.isEmpty {
                list[transformedString] = 1
            }
        }

        print(list.count)
        
        return list.count
    }
}

extension String {
    var asciiArray: [UInt32] {
        return unicodeScalars.filter{$0.isASCII}.map{$0.value}
    }
}
extension Character {
    var asciiValue: UInt32? {
        return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
    }
}


let solution = Solution()
solution.uniqueMorseRepresentations(["gin", "zen", "gig", "msg"])