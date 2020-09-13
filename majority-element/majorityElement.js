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
// 17.94%
var majorityElement2 = function(nums) {
  if (nums) {
    const sortedNums = nums.sort((a, b) => a - b) 

    const midIndex = parseInt(nums.length / 2)
    return sortedNums[midIndex]
  }
}

// 摩尔投票算法，将不同的数进行抵消，最终剩余的数即为出现次数 >n/2 的数。
/**
 * 
 * @param {[]} nums 
 */
// 33.21%
var majorityElement3 = function(nums) {
  if (nums && nums.length > 0) {
    // 不能被抵消的数
    let majority = nums[0]

    // 记录不能抵消的数量
    let count = 1

    let i = 1
    while (i < nums.length) {
      const num = nums[i]

      // 没有可以抵消的，直接更新
      if (count === 0) {
        // 更新 majority
        majority = num
        count = 1
      } else {
        if (majority !== num) {
          // 可以抵消
          count -= 1
        } else {
          count += 1
        }
      }
      i += 1
    }

    return majority
  }
}


const nums = [2,1,1,2,2,2]
console.log(majorityElement(nums))
console.log(majorityElement2(nums))
console.log(majorityElement3(nums))