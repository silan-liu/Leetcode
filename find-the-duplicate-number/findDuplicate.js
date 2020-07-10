/**
 * @param {number[]} nums
 * @return {number}
 */
// https://leetcode.com/problems/find-the-duplicate-number/
// 15.53%
var findDuplicate = function (nums) {
  if (nums.length >= 2) {
    const bitNum = Math.round((nums.length - 1) / 32);

    let bits = [];
    let i = 0;
    while (i < bitNum) {
      bits.push(0);
      i += 1;
    }

    i = 0;
    while (i < nums.length) {
      const num = nums[i];
      const index = num / 32;
      const mod = (num % 32) - 1;

      const val = 1 << mod;
      if (bits[index] & val) {
        return num;
      }

      bits[index] |= val;

      i += 1;
    }
  }

  return -1;
};

const nums = [
  13,
  46,
  8,
  11,
  20,
  17,
  40,
  13,
  13,
  13,
  14,
  1,
  13,
  36,
  48,
  41,
  13,
  13,
  13,
  13,
  45,
  13,
  28,
  42,
  13,
  10,
  15,
  22,
  13,
  13,
  13,
  13,
  23,
  9,
  6,
  13,
  47,
  49,
  16,
  13,
  13,
  39,
  35,
  13,
  32,
  29,
  13,
  25,
  30,
  13,
];
console.log(findDuplicate(nums));
