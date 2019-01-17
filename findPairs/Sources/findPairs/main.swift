// https://leetcode.com/problems/k-diff-pairs-in-an-array/submissions/
func findPairs(_ nums: [Int], _ k: Int) -> Int {
    if k < 0 {
        return 0
    }
    var map = [Int: Int]()

    for n in nums {
        var c = 1
        if let value = map[n] {
            c = value + 1
        }

        map[n] = c
    }

    var count = 0
    for (key, value) in map {
        // 需要判断个数是否>=2
        if k == 0 {
            if value >= 2 {
                count += 1
            } 
        } else {
            if let _ = map[key + k] {
                count += 1
            }
        }
    }

    return count
}

let nums = [1, 1, 2, 2], k = -1
print(findPairs(nums, k))