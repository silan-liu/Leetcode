// https://leetcode.com/problems/longest-increasing-subsequence/
/**
 * @param {number[]} nums
 * @return {number}
 */
// 61.54%
var lengthOfLIS = function (nums) {
  if (nums && nums.length > 0) {
    let result = 1;
    let lenList = [];

    // 从后往前计算
    let i = nums.length - 1;
    while (i >= 0) {
      // 同样从后往前计算比其大的最长递增序列长度
      let j = nums.length - 1;

      let maxLen = 0;
      while (j > i) {
        if (nums[j] > nums[i]) {
          // 计算 index，最末尾是 0
          const index = nums.length - 1 - j;

          // 计算最大值
          if (index >= 0 && index < lenList.length) {
            maxLen = Math.max(maxLen, lenList[index]);
          }
        }

        j -= 1;
      }

      maxLen += 1;
      if (result < maxLen) {
        result = maxLen;
      }

      lenList.push(maxLen);

      i -= 1;
    }

    return result;
  }

  return 0;
};

// [10,9,2,5,3,7,101,18], 4
const nums = [10, 9, 2, 5, 3, 7, 3, 1, 2, 3, 4, 5, 6, 7];
console.log(lengthOfLIS(nums));
