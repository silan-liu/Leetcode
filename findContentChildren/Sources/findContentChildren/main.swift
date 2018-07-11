// https://leetcode.com/problems/assign-cookies/description/
func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    var tmp = s
    var result = 0
    
    for f in g {
        // 找到>f，并且差值最小的index
        let minIndex = minDiffIndex(tmp, f)
        if minIndex >= 0 && minIndex < tmp.count {
            tmp.remove(at: minIndex)
            
            result += 1
        }
    }
    
    return result
}

func minDiffIndex(_ s: [Int], _ num: Int) -> Int {
    var min = Int.max
    
    var minIndex = -1
    var index = 0
    
    while index < s.count {
        let value = s[index]
        
        if value >= num {
            let diff = value - num
            if diff < min {
                min = diff
                minIndex = index
            }
        }
        
        index += 1
    }
    
    return minIndex
}

let g = [1,2], s = [1]
print(findContentChildren(g, s))
