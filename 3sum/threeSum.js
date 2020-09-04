// https://leetcode.com/problems/3sum/
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var threeSum = function (nums) {
  let result = [];
  nums.sort((a, b) => a - b);

  let i = 0;

  while (i < nums.length - 2) {
    const n1 = nums[i];

    let j = nums.length - 1;

    while (j > i + 1) {
      const n2 = nums[j];

      if (n1 <= 0 && n2 >= 0) {
        const sum = n1 + n2;

        let k = j - 1;
        while (k > i) {
          if (sum + nums[k] === 0) {
            // 保存结果
            const triplet = [n1, n2, nums[k]];
            result.push(triplet);
            break;
          }

          k -= 1;
        }

        j -= 1;
      } else {
        break;
      }
    }

    i += 1;
  }

  return result;
};

const nums = [-5, -4, 1, 2, 2, 3, 4, 0, 0, 1, 6];
console.log(threeSum(nums));
