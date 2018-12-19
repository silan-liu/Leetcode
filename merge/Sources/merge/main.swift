// https://leetcode.com/problems/merge-sorted-array/submissions/
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    if m > nums1.count || n > nums2.count || m + n > nums1.count {
        return
    }

    var nums = [Int]()
    var i = 0
    var j = 0

    while i < m, j < n {
        let n1 = nums1[i]
        let n2 = nums2[j]

        if n1 < n2 {
            // add n1
            nums.append(n1)
            i += 1
        } else {
            nums.append(n2)
            j += 1
        }
    }

    while i < m {
        nums.append(nums1[i])
        i += 1
    }

    while j < n {
        nums.append(nums2[j])
        j += 1
    }

    print(nums)

    // copy
    i = 0
    while i < nums.count {
        nums1[i] = nums[i]
        i += 1
    }
}

var nums1 = [1,2,3,0,0,0], m = 1
let nums2 = [2,5,6],       n = 3

merge(&nums1, m, nums2, n)
print(nums1)
