// https://leetcode.com/problems/excel-sheet-column-number/description/
func titleToNumber(_ s: String) -> Int {
    let map = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9, "J": 10, "K": 11, "L": 12, "M": 13, "N": 14, "O": 15, "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20, "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26]
    
    var multiplier = 1
    var result = 0
    
    for char in s.reversed() {
        if let value = map[String(char)] {
            result += value * multiplier
            multiplier *= 26
        }
    }
    
    return result
}

let s = "ZYA"
print(titleToNumber(s))
