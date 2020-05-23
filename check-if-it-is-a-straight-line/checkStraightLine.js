// https://leetcode.com/problems/check-if-it-is-a-straight-line/
/**
 * @param {number[][]} coordinates
 * @return {boolean}
 */
// 97.40%
var checkStraightLine = function (coordinates) {
  if (coordinates && coordinates.length > 0) {
    let i = 0
    let ratio = -1

    while (i < coordinates.length - 1) {
      const point1 = coordinates[i]
      const point2 = coordinates[i + 1]

      const xDistance = point2[0] - point1[0]
      const yDistance = (point2[1] - point1[1])

      if (xDistance === 0) {
        return false
      }

      const curRatio = yDistance / xDistance

      if (ratio === -1) {
        ratio = curRatio
      }

      if (Math.abs(curRatio - ratio) >= 1e-6) {
        return false
      }

      i += 1
    }

    return true
  }

  return false
};

// 94.16%
var checkStraightLine2 = function (coordinates) {
  if (coordinates && coordinates.length > 0) {
    const p1 = coordinates[0]
    const p2 = coordinates[1]

    const dx = p1[0] - p2[0]
    const dy = p1[1] - p2[1]

    let i = 1

    while (i < coordinates.length - 1) {
      const point1 = coordinates[i]
      const point2 = coordinates[i + 1]

      const xDistance = point2[0] - point1[0]
      const yDistance = (point2[1] - point1[1])

      if (xDistance * dy !== yDistance * dx) {
        return false
      }

      i += 1
    }

    return true
  }

  return false
};

const coordinates = [[0, 0], [1, 1]]
console.log(checkStraightLine(coordinates))
console.log(checkStraightLine2(coordinates))