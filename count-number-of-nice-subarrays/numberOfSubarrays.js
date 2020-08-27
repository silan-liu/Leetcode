// https://leetcode.com/problems/count-number-of-nice-subarrays/
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
// 90.36%
var numberOfSubarrays = function (nums, k) {
  if (!nums) {
    return 0;
  }

  let sum = 0;

  // 奇数的 index 列表
  let oddList = [];
  nums.forEach((element, index) => {
    if (element % 2 === 1) {
      oddList.push(index);
    }
  });

  let i = 0;
  while (i <= oddList.length - k) {
    let left = 0;
    let right = 0;

    // 计算左边的组合数，从原数组第一个数开始
    if (i === 0) {
      left = oddList[i] + 1;
    } else {
      // 计算相邻的个数
      left = oddList[i] - oddList[i - 1];
    }

    // 覆盖 k 个奇数
    // 计算右边的组合数
    const endIndex = i + k - 1;

    // 最后一个，组合个数可一直到原数组末尾
    if (endIndex == oddList.length - 1) {
      right = nums.length - oddList[endIndex];
    } else {
      // 计算相邻的个数
      right = oddList[endIndex + 1] - oddList[endIndex];
    }

    sum += left * right;

    i += 1;
  }

  return sum;
};

const nums = [2, 2, 1, 0, 4, 1, 2, 1, 1, 2],
  k = 3;
console.log(numberOfSubarrays(nums, k));
