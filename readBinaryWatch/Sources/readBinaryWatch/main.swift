// https://leetcode.com/problems/binary-watch/description/
func recursive(_ nums: [Int], _ n: Int, _ result: [Int], _ total: inout [[Int]]) {
    if n > 0 {
        if nums.count >= n  {
            var index = 0
            for num in nums {
                var list = result
                list.append(num)
                
                let subNums = Array(nums[index+1..<nums.count])
                recursive(subNums, n - 1, list, &total)
                index += 1
            }
        }
    } else {
        total.append(result)
    }
}

func readBinaryWatch(_ num: Int) -> [String] {
    let hours = [1,2,4,8]
    let mins = [1,2,4,8,16,32]
    
    var result = [String]()
    
    if num >= 0 {
        var i = 0
        while i <= num {
            let j = num - i
            if j > mins.count || j < 0 {
                i += 1
                continue
            }
            
            var hourResult = [[Int]]()
            recursive(hours, i, [], &hourResult)
            
            for list in hourResult {
                if list.count > 0 {
                    var sum = 0
                    for hour in list {
                        sum += hour
                    }
                }
            }
            
            print("hourResult:\(hourResult)")
            
            var minResult = [[Int]]()

            recursive(mins, j, [], &minResult)
            
            print("minResult:\(minResult)")
            
            for hourList in hourResult {
                let hour = sumOfList(hourList)
                if hour > 11 || hour < 0 {
                    continue
                }
                
                for minList in minResult {
                    let min = sumOfList(minList)
                    if min >= 0 && min <= 59 {
                        var minString = String(min)
                        if min >= 0 && min <= 9 {
                            minString = "0" + minString
                        }
                        
                        let str = String(hour) + ":" + minString
                        print(str)
                        result.append(str)
                    }
                }
            }
            
            i += 1
        }
    }
    
    return result
}

func sumOfList(_ list: [Int]) -> Int {
    var sum = 0
    for num in list {
        sum += num
    }
    
    return sum
}

func recursive_1(_ nums: [Int], _ n: Int, _ result: inout [Int], _ total: inout [[Int]]) {
    if n > 0 {
        if nums.count >= n  {
            var index = 0
        
            for num in nums {
                // 这里需要用个临时变量，copy
                var list = result
                
                list.append(num)
                
                let subNums = Array(nums[index+1..<nums.count])
                recursive_1(subNums, n - 1, &list, &total)
                index += 1
            }
        }
    } else {
        total.append(result)
    }
}

let nums = [0, 1, 2, 3, 4, 5, 6]
var result = [Int]()
var total = [[Int]]()
//recursive(nums, 7, result, &total)
//recursive_1(nums, 2, &result, &total)
readBinaryWatch(7)

print(total)
