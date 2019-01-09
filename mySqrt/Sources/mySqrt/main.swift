// https://leetcode.com/problems/sqrtx/submissions/
func mySqrt(_ x: Int) -> Int {
    var i = 0
    while true {
        let multiply = i * i
        if multiply == x {
            return i
        } else if multiply < x {
            if (i + 1) * (i + 1) > x {
                return i
            }
        }

        i += 1
    }
}

print(mySqrt(19))
