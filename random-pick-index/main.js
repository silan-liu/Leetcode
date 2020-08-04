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
    const targetList = [];
    this.nums.forEach((num, index) => {
      if (num === target) {
        targetList.push(index);
      }
    });

    if (targetList.length === 1) {
      return targetList[0];
    }
    const randomIndex = Math.floor(Math.random() * 10) % targetList.length;
    return targetList[randomIndex];
  }
};

const nums = [1, 2, 3, 3, 3];
var obj = new Solution(nums);
console.log(obj.pick(3));
