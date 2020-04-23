/**
 * @param {number[][]} pairs
 * @return {number}
 */
// 89.36%
var findLongestChain = function (pairs) {
  if (pairs && pairs.length > 0) {
    // 按 pair[1] 从小到大排序
    const sortedParis = pairs.sort((a, b) => {
      if (a[1] < b[1]) {
        return -1
      } else if (a[1] > b[1]) {
        return 1
      }

      return 0
    })

    let count = 1
    let preMax = sortedParis[0][1]
    let i = 1
    while (i < sortedParis.length) {
      const pair = sortedParis[i]
      if (pair[0] > preMax) {
        count += 1
        preMax = pair[1]
      }

      i += 1
    }

    console.log(sortedParis)

    return count
  }

  return 0
};

const pairs = [[1, 2]]
console.log(findLongestChain(pairs))