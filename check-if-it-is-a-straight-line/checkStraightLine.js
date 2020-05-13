// https://leetcode.com/problems/check-if-it-is-a-straight-line/
/**
 * @param {number[][]} coordinates
 * @return {boolean}
 */
// 27.92% 
var checkStraightLine = function (coordinates) {
  if (coordinates && coordinates.length > 0) {
    let i = 0
    let ratio = -1

    while (i < coordinates.length - 1) {
      const point1 = coordinates[i]
      const point2 = coordinates[i + 1]

      const xDistance = point2[0] - point1[0]
      const yDistance = (point2[1] - point1[1])
      const curRatio = Math.abs(yDistance / xDistance)

      if (ratio === -1) {
        ratio = curRatio
      }

      console.log(curRatio, ratio)

      if (Math.abs(curRatio - ratio) >= 1e-6) {
        return false
      }

      i += 1
    }

    return true
  }

  return false
};

const coordinates = [[-4, -3], [1, 0], [3, -1], [0, -1], [-5, 2]]
console.log(checkStraightLine(coordinates))