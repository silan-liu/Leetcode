// https://leetcode.com/problems/3sum/
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
//  88.07%
var threeSum = function (nums) {
  let result = []

  nums.sort((a, b) => a - b)

  let i = 0

  // 固定 nums[i]
  for (let i = 0; i < nums.length - 2; i += 1) {
    // 如果是相同的数，跳过
    if (i > 0 && nums[i] === nums[i - 1]) {
      continue
    }

    const target = 0 - nums[i]

    let l = i + 1
    let h = nums.length - 1

    // 二分法
    while (l < h) {
      if (nums[l] + nums[h] === target) {

        result.push([nums[i], nums[l], nums[h]])

        // 有相同的数
        while (l < h && nums[l] === nums[l + 1]) {
          l += 1
        }

        // 有相同的数
        while (l < h && nums[h] === nums[h - 1]) {
          h -= 1
        }

        l += 1
        h -= 1
      } else if (nums[l] + nums[h] < target) {
        l += 1
      } else {
        h -= 1
      }
    }
  }

  return result
};

const nums = [-1, 0, 1, 2, -1, -4]
console.log(threeSum(nums));
