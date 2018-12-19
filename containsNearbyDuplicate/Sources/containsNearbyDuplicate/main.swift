// https://leetcode.com/problems/contains-duplicate-ii/submissions/
// 可以优化
func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var map = [Int: [Int]]()

    var i = 0
    while i < nums.count {
        let n = nums[i]
        var list = map[n]
        if list == nil {
            list = [Int]()
        }

        list?.append(i)
        map[n] = list

        i += 1
    }

    print(map)

    // 遍历map
    for (_, v) in map {
        let list = v as [Int]
        if list.count >= 2 {
            var i = 0
            while i < list.count - 1 {
                let index1 = list[i]
                let index2 = list[i + 1]

                if index2 - index1 <= k {
                    return true
                }

                i += 1
            }
        }
    }
    
    return false
}

func containsNearbyDuplicate_2(_ nums: [Int], _ k: Int) -> Bool {
    var map = [Int: Int]()
    var i = 0
    while i < nums.count {
        let n = nums[i]
        if let index = map[n] {
            // 计算大小
            print(index, i)
            if i - index <= k {
                return true
            }
        }

        map[n] = i

        i += 1
    }

    return false
}

let nums = [1,2,3,1,2,3], k = 2
let result = containsNearbyDuplicate(nums, k)
print(result)

print(containsNearbyDuplicate_2(nums, k))

