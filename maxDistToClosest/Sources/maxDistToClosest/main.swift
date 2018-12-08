// https://leetcode.com/problems/maximize-distance-to-closest-person/
func maxDistToClosest(_ seats: [Int]) -> Int {
    var maxDist = 0
    
    var last = -1
    var next = -1
    var cur = 0
    
    while cur < seats.count {
        
        if seats[cur] == 0 {
            
            // 如果当前index大于了上次找到的最后一个1，需重新寻找下一个1
            if next != -1, cur > next {
                next = -1
            }
            
            if next == -1 {
                // 往后找第一个1
                var i = cur + 1
                while i < seats.count {
                    if seats[i] == 1 {
                        break
                    }
                    
                    i += 1
                }
                
                // 没找到
                if i == seats.count {
                    next = -1
                } else {
                    next = i
                }
            }
            
            // 计算最近人的距离
            var left = Int.max
            if last != -1 {
                left = cur - last
            }
            
            var right = Int.max
            if next != -1 {
                right = next - cur
            }
            
            let closest = min(left, right)
            maxDist = max(maxDist, closest)
            
        } else if seats[cur] == 1 {
            last = cur
        }
        
        cur += 1
    }
    
    return maxDist
}

let nums = [1,0,0,0,1]
print(maxDistToClosest(nums))
