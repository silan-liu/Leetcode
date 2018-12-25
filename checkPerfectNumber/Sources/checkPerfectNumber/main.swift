// https://leetcode.com/problems/perfect-number/submissions/
// time limited
func checkPerfectNumber(_ num: Int) -> Bool {
    if num <= 0 {
        return false
    }

    var i = 1
    var sum = 0
    while i <= num / 2 {
        if num % i == 0 {
            sum += i
        }

        i += 1
    }

    return sum == num
}

func checkPerfectNumber_2(_ num: Int) -> Bool {
    if num <= 0 {
        return false
    }

    var i = 1
    var sum = 0
    while i <= num / 2 {
        if num % i == 0 {
            // 同时计算商，减少次数
            let n = num / i

            // 如果未超过，则说明在前半部分，防止重复加
            if i <= n {
                sum += i
                if n != num, n != i {
                    sum += n
                }
            } else {
                break
            }            
        }

        i += 1
    }

    return sum == num
}

// 次数更少
func checkPerfectNumber_3(_ num: Int) -> Bool {
    if num <= 0 {
        return false
    }

    var i = 1
    var sum = 0
    while i * i <= num {
        if num % i == 0, i != num {
            // 同时计算商，减少次数
            let n = num / i

            sum += i
            if n != num, n != i {
                sum += n
            }            
        }

        i += 1
    }

    return sum == num
}

let num = 9999993
print(checkPerfectNumber(num))
print(checkPerfectNumber_2(num))
print(checkPerfectNumber_3(num))
