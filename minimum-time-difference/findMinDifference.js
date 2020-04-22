
// https://leetcode.com/problems/minimum-time-difference/submissions/
/**
 * @param {string[]} timePoints
 * @return {number}
 */
// 5.61% 
var findMinDifference = function (timePoints) {
  if (timePoints && timePoints.length > 0) {
    // 24 * 60
    const fullTime = 1440
    const timeList = []

    // 解析时间并转换成整数
    timePoints.forEach(time => {
      const list = time.split(':')

      if (list && list.length === 2) {
        const hour = parseInt(list[0])
        const minute = parseInt(list[1])

        const t = hour * 60 + minute
        timeList.push(t)
      }
    })

    let minDiff = Number.MAX_VALUE
    let i = 0
    while (i < timeList.length - 1) {
      const t1 = timeList[i]
      let j = i + 1
      while (j < timeList.length) {
        const t2 = timeList[j]
        const tmp = Math.abs(t1 - t2)
        const diff = Math.min(fullTime - tmp, tmp)

        if (diff < minDiff) {
          minDiff = diff
        }

        j += 1
      }
      i += 1
    }

    return minDiff
  }
};

const timePoints = ["23:59", "03:22", "05:34"]
console.log(findMinDifference(timePoints))