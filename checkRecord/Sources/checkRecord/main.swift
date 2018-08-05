 // https://leetcode.com/problems/student-attendance-record-i/description/
 // A <= 1 或者 连续的L <= 2
 func checkRecord(_ s: String) -> Bool {
    var countOfA = 0
    var countOfL = 0
    var lastChar = Character("a")
    
    for c in s {
        if c == "L" {
            if lastChar == "L" {
                countOfL += 1
            } else {
                countOfL = 1
            }
        }
        else {
            countOfL = 0
            
            if c == "A" {
                countOfA += 1
            }
        }
        
        lastChar = c
        
        if countOfA > 1 {
            return false
        }
        
        if countOfL > 2 {
            return false
        }
    }
    
    return true
 }

 let s = "APPALL"
 print(checkRecord(s))
