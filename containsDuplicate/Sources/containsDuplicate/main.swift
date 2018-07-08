
// https://leetcode.com/problems/contains-duplicate/description/
func containsDuplicate(_ nums: [Int]) -> Bool {
    var map = [Int: Int]()
    
    for num in nums {
        let value = map[num]
        if value == nil {
            map[num] = 1
        } else {
            if value! == 1 {
                return true
            }
        }
    }
    
    return false
}


let nums = [1,2,3,1]
print(containsDuplicate(nums))
