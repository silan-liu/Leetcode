// https://leetcode.com/problems/reach-a-number/submissions/
func reachNumber(_ target: Int) -> Int {
    if target == 0 {
        return 0
    }
    
    var i = 1
    var sum = 0
    while true {
        sum += i
        if sum == target {
            return i
        } else if sum < target {
            i += 1
        } else {
            // 计算要减的数
            let delta = sum - target
            // +变-，需要减去2倍
            if delta % 2 == 0 {
                let n = delta / 2
                // 要减去的数
                if n <= i * (i + 1) / 2 {
                    return i
                } else {
                    i += 1
                }
            } else {
                i += 1
            }
        }
    }
}

let target = -5
print(reachNumber(target))
