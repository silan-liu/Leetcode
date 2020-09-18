// https://leetcode.com/problems/first-missing-positive/
/**
 * @param {number[]} nums
 * @return {number}
 */
var firstMissingPositive = function (nums) {
  if (nums && nums.length > 0) {
    let left = 0;
    let right = 0;
    nums.forEach((num) => {
      if (num > 0) {
        if (left === 0 && right === 0) {
          left = num;
          right = num;
        } else {
          if (num < left) {
            left = num;
          } else if (right - left <= 1 && num > right) {
            right = num;
          }
        }
      }
    });

    console.log(left, right);
    if (left > 1) {
      return 1;
    }

    // 中间无可用正数
    if (right - left <= 1) {
      return right + 1;
    }

    return left + 1;
  }

  return 1;
};

const nums = [1, 2, 0, 5];
console.log(firstMissingPositive(nums));
