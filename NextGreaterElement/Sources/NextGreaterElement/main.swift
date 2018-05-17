 // https://leetcode.com/problems/next-greater-element-i/description/
 func nextGreaterElement(_ findNums: [Int], _ nums: [Int]) -> [Int] {
    if findNums.count > 0 && nums.count > 0 {
        
        var i = 0
        var map = [Int: Int]()
        var result = [Int]()
        
        while i < nums.count {
            let index = nums.index(nums.startIndex, offsetBy: i)
            
            map[nums[index]] = index
            
            i += 1
        }

        for n in findNums {
            if let index = map[n] {
                
                var j = index + 1
                var exist = false
                while j < nums.count {
                    if nums[j] > n {
                       
                       exist = true
                        result.append(nums[j])
                        break
                    }
                    
                    j += 1
                }
                
                if !exist {
                    result.append(-1)
                }
            }
        }
        
        return result
    }
    
    return []
 }
 
 let nums1 = [4,1,2], nums2 = [1,3,4,2]
 
 print(nextGreaterElement(nums1, nums2))
