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

// 二分法
func mySqrt_2(_ x: Int) -> Int {
    if x == 0 {
        return 0
    }

    var left = 1
    var right = x 

    while left <= right {
        let mid = left + (right - left) / 2

        if mid == x / mid {
            return mid
        } else if mid < x / mid {
            if (mid + 1) > x / (mid + 1) {
                return mid
            }

            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return left
}

let n = 1232353443652
print(mySqrt(n))
print(mySqrt_2(n))
