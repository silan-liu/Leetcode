 // https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/
 // numbers是排序过的
 func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = numbers.count - 1
    
    // 从后遍历，从前面找到合适的值
    while right <= numbers.count - 1, left < right {
       let rightValue = numbers[right]
        
        let value = target - rightValue;
        
        // 找到==value的值
        while numbers[left] < value, left < right {
            left += 1
        }
        
        if left != right {
            if numbers[left] == value {
                return [left + 1, right + 1]
            }
        }
        
        right -= 1
    }
    
    return []
 }
 
 let numbers = [2,4,7,11,15], target = 9
 
 print(twoSum(numbers, target))
 
 
