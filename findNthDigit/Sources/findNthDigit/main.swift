// https://leetcode.com/problems/nth-digit/submissions/
func findNthDigit(_ n: Int) -> Int {
    if n <= 9 {
        return n
    }

    // 除数
    var divisor = 10

    // nth
    var count = 9

    // 位数
    var w = 2

    // 当前的数
    var i = 10

    while true {
      if count < n {
            if i / divisor >= 10 {
                // 位数+1
                w += 1
                divisor *= 10
            }

            if count + w >= n {
                // 从左算起的位数
                let left = n - count
                
                // 计算left的值
                var j = 1
                var num = i
                var b = 0
                var d = divisor
                while j <= left {
                    b = num / d
                    num = num % d

                    d /= 10
                    j += 1                    
                }

                return b
            }

            count += w
            i += 1
        }
    }
}

let n = 17009888
print(findNthDigit(n))