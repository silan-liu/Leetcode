// https://leetcode.com/problems/valid-mountain-array/submissions/
func validMountainArray(_ A: [Int]) -> Bool {
    if A.count < 3 {
        return false
    }
    
    var last = A[0]
    var index = 0
    var flag = false
    
    var i = 1
    while i < A.count {
        let num = A[i]
        
        if num > last {
            if flag {
                return false
            }
            
            last = num
            index = i
        } else if num < last {
            // 最高点
            if index > 0 {
                flag = true
                last = num
            } else {
                return false
            }
        } else {
            return false
        }
        
        i += 1
    }
    
    return index != 0 && index != A.count - 1
}

let nums = [5,4,3,2,1]
print(validMountainArray(nums))
