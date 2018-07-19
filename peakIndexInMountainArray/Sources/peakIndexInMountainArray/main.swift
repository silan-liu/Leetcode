// https://leetcode.com/problems/peak-index-in-a-mountain-array/description/
// 即为求最大的数
func peakIndexInMountainArray(_ A: [Int]) -> Int {
    var max = Int.min
    var maxIndex = 0
    var index = 0
    for num in A {
        if num > max {
            max = num
            maxIndex = index
        }
        
        index += 1
    }
    
    return maxIndex
}

let numbers = [0,2,1,0]
print(peakIndexInMountainArray(numbers))
