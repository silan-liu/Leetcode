// https://leetcode.com/problems/binary-search/
func search(_ nums: [Int], _ target: Int) -> Int {
    var low = 0
    var high = nums.count - 1
    var mid = 0
    
    while low <= high {
        mid = (low + high) / 2
        let value = nums[mid]
        if value == target {
            return mid
        } else if value > target {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return -1
}

let nums = [-1,0,3,5,9,12], target = 2
print(search(nums, target))
