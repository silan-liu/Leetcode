
// https://leetcode.com/problems/lemonade-change/description/
func lemonadeChange(_ bills: [Int]) -> Bool {
    var map = [Int: Int]()
    
    for bill in bills {
        if bill == 5 {
            if let value = map[bill] {
                map[bill] = value + 1
            } else {
                map[bill] = 1
            }
        } else if bill == 10 {
            // 检查是否有5元零钱
            if let value = map[5], value >= 1 {
                map[5] = value - 1
            } else {
                return false
            }
            
            // 存储10
            if let value = map[bill] {
                map[bill] = value + 1
            } else {
                map[bill] = 1
            }
        } else if bill == 20 {
            // 检查是否有10，5的零钱
            if let value1 = map[5], value1 >= 1, let value2 = map[10], value2 >= 1 {
                map[5] = value1 - 1
                map[10] = value2 - 1
            } else {
                // 检查是否有3个5
                if let value = map[5], value >= 3 {
                    map[5] = value - 3
                } else {
                    return false
                }
            }
            
            // 存储20。其实20不用存
            if let value = map[bill] {
                map[bill] = value + 1
            } else {
                map[bill] = 1
            }
        } else {
            return false
        }
    }
    
    return true
}

let bills = [5,5,5,20]
print(lemonadeChange(bills))
