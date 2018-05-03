import Foundation

func numberOfLines(_ widths: [Int], _ S: String) -> [Int] {
    
    var i: Int = 0
    let count = S.count
    var lineWidth = 0
    var lines = 1

    while i < count {
        let index = S.index(S.startIndex, offsetBy: i)
        let s = S[index]
        let width = widthOfChar(s, widths)

        let tmp = lineWidth + width

        if tmp > 100 {
            lines += 1
            lineWidth = width
        } else if tmp == 100 {
            if i != count - 1 {
                lines += 1
                lineWidth = 0
            } else {
                lineWidth = tmp
            }
        } else {
            lineWidth = tmp
        }

        i += 1
    }

    return [lines, lineWidth]
}

func widthOfChar(_ s: Character, _ widths: [Int]) -> Int {
    if let ascii = s.ascii {
        let index = (Int)(ascii - 97)
        if index >= 0 && index < widths.count {
            let width = widths[index]
            
            return width
        }
    }

    return 0
}

extension Character {
    var ascii: UInt32? {
        return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
    }
}

let widths = [4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
let S = "bbbcccdddaaa" 

print(numberOfLines(widths, S))