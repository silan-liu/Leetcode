// https://leetcode.com/problems/first-missing-positive/
/**
 * @param {number[]} nums
 * @return {number}
 */
var firstMissingPositive = function (nums) {
  if (nums && nums.length > 0) {
    // 先把每个正数放到正确的位置
    let i = 0;
    const len = nums.length;

    while (i < len) {
      const num = nums[i];
      if (num > 0 && num < len) {
        // 它应该放在 num - 1 的位置上，进行交换
        if (nums[num - 1] !== num) {
          const tmp = nums[num - 1];
          nums[num - 1] = num;
          nums[i] = tmp;
        }
      }

      i += 1;
    }

    i = 0;
    while (i < len) {
      if (nums[i] !== i + 1) {
        return i + 1;
      }
      i += 1;
    }

    // 如果已经是在正确的位置，则直接返回最右边的数
    return len + 1;
  }

  return 1;
};

const nums = [-1, 3, 4, 6, 0, 5];
console.log(firstMissingPositive(nums));
