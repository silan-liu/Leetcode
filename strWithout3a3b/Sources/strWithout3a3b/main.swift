
func strWithout3a3b(_ A: Int, _ B: Int) -> String {
    
    let lenA = A / 2
    var realLenA = lenA
    if A % 2 != 0 {
        realLenA += 1
    }

    let lenB = B / 2
    var realLenB = lenB
    if B % 2 != 0 {
        realLenB += 1
    }
    
    var i = 0
    var result = ""
    while i < realLenA || i < realLenB {
        if B / A > 2 {
            if i < realLenB {
                if i < lenB {
                    result += "bb"
                } else {
                    result += "b"
                }
            } 

            if i < realLenA {
                if i < lenA {
                    result += "aa"
                } else {
                    result += "a"
                }
            }
        } else {
            if i < realLenA {
                if i < lenA {
                    result += "aa"
                } else {
                    result += "a"
                }
            } 

            if i < realLenB {
                if i < lenB {
                    result += "bb"
                } else {
                    result += "b"
                }
            }
        }
        

        i += 1
    }


    return result
}

print(strWithout3a3b(3,6))
