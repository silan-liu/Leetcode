/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
// https://leetcode.com/problems/kth-largest-element-in-an-array/
// 5.00%
var findKthLargest = function(nums, k) {
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

const nums = [2,4,3,2,1,1,2,5]
const k = 3
console.log(findKthLargest(nums, k))