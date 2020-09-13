// https://leetcode.com/problems/majority-element
/**
 * @param {number[]} nums
 * @return {number}
 */
// 80.73% 
var majorityElement = function(nums) {
    let numCountMap = new Map()
    let i = 0
    while (i < nums.length) {
      const num = nums[i]

      let count = 0
      if (numCountMap.has(num)) {
        count = numCountMap.get(num)
      }

      count += 1
      if (count > parseInt(nums.length / 2)) {
        return num
      }

      numCountMap.set(num, count)

      i += 1
    }
};

// 排序，数组中间的值肯定是众数
/**
 * 
 * @param {[]} nums 
 */
var majorityElement2 = function(nums) {
  if (nums) {
    const sortedNums = nums.sort((a, b) => a - b) 

    const midIndex = parseInt(nums.length / 2)
    return sortedNums[midIndex]
  }
}

const nums = [2,1,1]
console.log(majorityElement(nums))
console.log(majorityElement2(nums))