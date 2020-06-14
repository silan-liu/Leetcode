/**
 * @param {number[]} arr
 * @return {number}
 */
//https://leetcode.com/problems/max-chunks-to-make-sorted/
// 30.36%
var maxChunksToSorted = function (arr) {
  if (arr && arr.length > 0) {
    let maxNum = arr[0];

    // 存储每一段的最大值
    let chunksMaxNum = [arr[0]];
    var i = 1;

    while (i <= arr.length - 1) {
      let flag = false;

      // 逐个与 chunksMaxNum 进行比较
      let j = 0;
      while (j < chunksMaxNum.length) {
        if (arr[i] < chunksMaxNum[j]) {
          // 标记为已处理
          flag = true;

          // 从 j 起，需要合并
          // 最后一个最大值不删
          chunksMaxNum.splice(j, chunksMaxNum.length - j - 1);
          break;
        }

        j += 1;
      }

      // 可单独为 chunk
      if (!flag) {
        chunksMaxNum.push(arr[i]);
      }

      i += 1;
    }

    return chunksMaxNum.length;
  }

  return 0;
};

const arr = [1, 2, 3, 0, 4, 5, 8, 7, 9, 6];
console.log(maxChunksToSorted(arr));
