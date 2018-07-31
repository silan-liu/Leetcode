
var total = [[Int]]()
func recursive(_ nums: [Int], _ n: Int, _ result: [Int]) {
    if n > 0 {
        if nums.count >= n  {
            var index = 0
            for num in nums {
                var list = result
                list.append(num)
                
                let subNums = Array(nums[index+1..<nums.count])
                recursive(subNums, n - 1, list)
                index += 1
            }
        }
    } else {
        total.append(result)
    }
}

func recursive_1(_ nums: [Int], _ n: Int, _ result: inout [Int]) {
    if n > 0 {
        if nums.count >= n  {
            var index = 0
        
            for num in nums {
                // 这里需要用个临时变量，copy
                var list = result
                
                list.append(num)
                
                let subNums = Array(nums[index+1..<nums.count])
                recursive_1(subNums, n - 1, &list)
                index += 1
            }
        }
    } else {
        total.append(result)
    }
}

let nums = [0, 1, 2, 3]
var result = [Int]()
//recursive(nums, 2, result)
recursive_1(nums, 2, &result)

print(total)
