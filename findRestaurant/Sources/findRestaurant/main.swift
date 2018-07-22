// https://leetcode.com/problems/minimum-index-sum-of-two-lists/description/
func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
    var indexMap1 = [String: Int]()
    var indexMap2 = [String: Int]()
    
    var i = 0
    for restaurant in list1 {
        indexMap1[restaurant] = i
        
        i += 1
    }
    
    i = 0
    
    for restaurant in list2 {
        indexMap2[restaurant] = i
        
        i += 1
    }
    
    var result = [String]()
    
    var minSum = Int.max
    
    // 因为需要输出所有index之和相同并且最小的restaurant
    for (key1, value1) in indexMap1 {
        if let value2 = indexMap2[key1] {
            let sum = value1 + value2
            
            // 需要将result情况再添加
            if sum < minSum {
                minSum = sum
                result.removeAll()
                
                result.append(key1)
            } else if sum == minSum {
                // 如果等于最小值，则直接添加
                result.append(key1)
            }
        }
    }
    
    return result
}

let list1 = [ "KFC", "Shogun", "Tapioca Express", "Burger King"]

let list2 = [ "Shogun", "KFC", "Burger King"]

print(findRestaurant(list1, list2))
