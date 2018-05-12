
// https://leetcode.com/problems/roman-to-integer/description/
func romanToInt(_ s: String) -> Int {
    let map = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    
    let count = s.count
    var i = 0
    
    var sum = 0
    
    while i < count {
        let index = s.index(s.startIndex, offsetBy: i)
        let item = s[index]
        
        if item == "I" || item == "X" || item == "C" {
            if i + 1 <= count - 1 {
                let nextIndex = s.index(s.startIndex, offsetBy: i + 1)
                let nextItem = s[nextIndex]
                
                if item == "I" {
                    if nextItem == "V" {
                        sum += 4
                        i += 1
                    } else if nextItem == "X" {
                        sum += 9
                        i += 1
                    } else {
                        if let value =  map[String(item)] {
                            sum += value
                        }
                    }
                }
                else if item == "X" {
                    if nextItem == "L" {
                        sum += 40
                        i += 1
                    } else if nextItem == "C" {
                        sum += 90
                        i += 1
                    } else {
                        if let value =  map[String(item)] {
                            sum += value
                        }
                    }
                } else if item == "C" {
                    if nextItem == "D" {
                        sum += 400
                        i += 1

                    } else if nextItem == "M" {
                        sum += 900
                        i += 1
                    } else {
                        if let value =  map[String(item)] {
                            sum += value
                        }
                    }
                }
            } else {
                if let value =  map[String(item)] {
                    sum += value
                }
            }
        } else {
            if let value =  map[String(item)] {
                sum += value
            }
        }
        
        i += 1
    }
    
    return sum
}

print(romanToInt("MCDLXXVI"))
