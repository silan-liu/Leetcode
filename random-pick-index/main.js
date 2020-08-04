/**
 * @param {number[]} nums
 */
// https://leetcode.com/problems/random-pick-index/
var Solution = function (nums) {
  this.nums = nums;
};

/**
 * @param {number} target
 * @return {number}
 */
Solution.prototype.pick = function (target) {
  if (this.nums && this.nums.length > 0) {
    let count = 0;
    let result = -1;

    this.nums.forEach((num, index) => {
      if (num === target) {
        count += 1;

        // 蓄水池概率问题，当新加入一个数 count，在 [0, count-1] 取随机数，如果取到 count 的概率为 1/count，那么之前加入数的概率也会变成 1/count。
        const randomIndex = Math.floor(Math.random() * 10) % count;
        if (randomIndex === 0) {
          result = index;
        }
      }
    });

    return result;
  }
};

const nums = [1, 2, 3, 3, 3];
var obj = new Solution(nums);
console.log(obj.pick(3));
