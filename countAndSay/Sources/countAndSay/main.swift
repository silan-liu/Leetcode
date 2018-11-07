// https://leetcode.com/problems/count-and-say/
func countAndSay(_ n: Int) -> String {
    if n <= 1 {
        return "1"
    }
    
    var last = [1]
    
    var i = 1
    var count = 1
    while i < n {
        
        if last.count >= 1 {
            var j = 1
            var result = [Int]()
            count = 1
            
            while j < last.count {
                if last[j] == last[j - 1] {
                    count += 1
                } else {
                    // 计算
                    result.append(count)
                    result.append(last[j - 1])
                    
                    count = 1
                }
                
                j += 1
            }
            
            // 退出循环需再次计算
            result.append(count)
            result.append(last[j - 1])
            
            last = result
        }
        
        i += 1
    }
    
    var str = ""
    for n in last {
        str += String(n)
    }
    
    return str
}


let n = 8
print(countAndSay(n))
