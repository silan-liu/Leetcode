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

func validMountainArray_2(_ A: [Int]) -> Bool {
    if A.count < 3 {
        return false
    }
    
    var i = 0
    while i + 1 < A.count, A[i] < A[i+1] {
        i += 1
    }
    
    if i == 0 || i == A.count - 1 {
        return false
    }
    
    // 最高点
    while i + 1 < A.count, A[i] > A[i+1] {
        i += 1
    }
    
    return i == A.count - 1
}

let nums = [5,4,3,2,1]
print(validMountainArray(nums))
print(validMountainArray_2(nums))
