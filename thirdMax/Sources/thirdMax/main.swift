// https://leetcode.com/problems/third-maximum-number/submissions/
func thirdMax(_ nums: [Int]) -> Int {
    var max1 = Int.min
    var max2 = Int.min
    var max3 = Int.min

    for n in nums {
        // 除去相同的数
        if n == max1 || n == max2 || n == max3 {
            continue
        }

        if n > max1 {
            max3 = max2
            max2 = max1
            max1 = n
        } else if n > max2 {
            max3 = max2
            max2 = n
        } else if n > max3 {
            max3 = n
        }
    }

    if max3 == Int.min {
        return max1
    }

    return max3
}

let nums = [1,2,2,5,3,5]
print(thirdMax(nums))