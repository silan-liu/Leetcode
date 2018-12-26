import Foundation
// https://leetcode.com/problems/sum-of-square-numbers/submissions/
// time limited
func judgeSquareSum(_ c: Int) -> Bool {
    if c < 0 {
        return false
    }

    var i = 0
    while i * i <= c / 2 {
        var j = i
        while true {
            let sum = i * i + j * j
            if sum == c {
                return true
            } else if sum > c {
                break
            }

            j += 1
        }
       
       i += 1
    }

    return false
}

func judgeSquareSum_2(_ c: Int) -> Bool {
    if c < 0 {
        return false
    }

    var i = 0
    var j = Int(sqrt(Double(c)))

    while j >= 0, i <= j {
        let sum = i * i + j * j
        if sum == c {
            return true
        } else if sum < c {
            i += 1
        } else {
            j -= 1
        }
    }

    return false
}


// print(judgeSquareSum(2147482647))
print(judgeSquareSum_2(2147482647))