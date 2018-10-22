// https://leetcode.com/problems/search-insert-position/submissions/
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    if nums.count > 0 {
        var low = 0
        var high = nums.count - 1
        var mid = 0
        
        while low <= high {
            mid = (low + high) / 2
            let value = nums[mid]
            
            if value == target {
                return mid
            } else if value < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return low
    } else {
        return -1
    }
}

let nums = [1,3,5,6,9,10,18]
let target = 19

print(searchInsert(nums, target))
