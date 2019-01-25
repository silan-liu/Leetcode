// 3,4,2,3
func checkPossibility(_ nums: [Int]) -> Bool {
    
    if nums.count <= 2 {
        return true
    }
    
    var i = 0
    var j = i + 1
    var count = 0
    while j < nums.count {
        if nums[i] <= nums[j] {
            i += 1
            j += 1
        } else {
            count += 1
            if count >= 2 {
                return false
            }

            j += 1
        }
    }

    return true
}

let nums = [-1,4,2,3]
print(checkPossibility(nums))