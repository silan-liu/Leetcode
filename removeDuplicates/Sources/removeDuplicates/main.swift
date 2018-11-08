// https://leetcode.com/problems/remove-duplicates-from-sorted-array/
func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count >= 1 {
        var lastIndex = 1
        var lastNum = nums[0]
        
        var i = 1
        while i < nums.count {
            let num = nums[i]
            if num != lastNum {
                // 将不同的数覆盖到对应的位置
                nums[lastIndex] = num
                
                lastIndex += 1
                
                lastNum = num
            }
            
            i += 1
        }
        
        return lastIndex
    }
    
    return 0
}

// c 语言
/*int removeDuplicates(int* nums, int numsSize) {
    if (numsSize >= 1) {
        int lastIndex = 1;
        int lastNum = nums[0];
 
        int i = 1;
        while (i < numsSize) {
            int num = nums[i];
            if (num != lastNum) {
                 // 将不同的数覆盖到对应的位置
                 nums[lastIndex++] = num;
 
                 lastNum = num;
            }
            
            i += 1;
        }
        
        return lastIndex;
    }
    
    return 0;
}
 */

var nums = [2,2,3,3,5,5,6,7,7]
print(removeDuplicates(&nums))
print(nums)
