class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        let count = nums.count
        var j = 0
        var k = 0
        while j < count {
            if (j != count - 1) {
                k = j + 1
                print("k:\(k)")

                while k < count {
                    if (nums[j] + nums[k] == target) {
                        return [j, k]
                    }

                    k = k + 1
                }
            }
            
            j = j + 1
        }
        
        return [0]
    }
}

let s = Solution()
let result = s.twoSum([1, 2, 2], 4)
print("\(result)")

