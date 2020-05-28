/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
// https://leetcode.com/problems/kth-largest-element-in-an-array/
// 5.00%
var findKthLargest = function (nums, k) {
    if (nums && nums.length > 0) {
        const result = recursive(nums, 0, nums.length - 1, k)
        return result
    }
};

var recursive = function (nums, start, end, k) {
    // 数组个数大于 k
    if (end - start + 1 >= k) {
        // 选定第一个元素
        const pivot = nums[start]
        const leftParts = []
        const rightParts = []

        i = start + 1
        while (i <= end) {
            if (nums[i] < pivot) {
                leftParts.push(nums[i])
            } else {
                rightParts.push(nums[i])
            }

            i += 1
        }

        const len = rightParts.length + 1

        // 则 pivot 是要找的数
        if (len === k) {
            return pivot
        } else if (len < k) {
            // 往左边找
            return recursive(leftParts, 0, leftParts.length - 1, k - len)
        } else {
            // 往右边找
            return recursive(rightParts, 0, rightParts.length - 1, k)
        }
    }

    return -1
}

// 37.45%
var findKthLargest2 = function (nums, k) {
    if (nums && nums.length > 0) {
        const result = recursive2(nums, 0, nums.length - 1, k)
        return result
    }
};

var recursive2 = function (nums, start, end, k) {
    // 数组个数大于 k
    if (end - start + 1 >= k) {
        // 选定第一个元素
        const pivot = nums[start]

        let i = start
        let j = end

        while (i < j) {
            // 从后往前找比其小的
            while (i < j & nums[j] >= pivot) {
                j--
            }

            // 从前往后找比其大的
            while (i < j && nums[i] <= pivot) {
                i++
            }

            // 交换
            swap(nums, i, j)
        }

        // i == j，交换 nums[i] 与 pivot
        swap(nums, i, start)

        // 从 i 开始到末尾有多少个数
        const len = end + 1 - i
        if (len === k) {
            return pivot
        } else if (len < k) {
            // 往左边找
            return recursive2(nums, start, i - 1, k - len)
        } else {
            // 往右边找
            return recursive2(nums, i + 1, end, k)
        }
    }

    return -1
}

var swap = function (nums, i, j) {
    if (nums && i >= 0 && i < nums.length && j >= 0 && j < nums.length && i !== j) {
        const tmp = nums[i]
        nums[i] = nums[j]
        nums[j] = tmp
    }
}

const nums = [1, 2, 3, 7, 6, 5]
const k = 3
console.log(findKthLargest(nums, k))
console.log(findKthLargest2(nums, k))