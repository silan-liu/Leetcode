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
            let n = num / i
            print(n)
            if i <= n {
                sum += i
                if n != num, n != i {
                    sum += n
                }
            } else {
                break
            }
            
            print("sum:\(sum)")
        }

        i += 1
    }

    print(sum)
    return sum == num
}

let num = 9999993
print(checkPerfectNumber(num))
print(checkPerfectNumber_2(num))
