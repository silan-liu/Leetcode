
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

// 55.14%
var findMinDifference2 = function (timePoints) {
  if (timePoints && timePoints.length > 0) {

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

    // 排序
    const sortedTimeList = timeList.sort((a, b) => {
      if (a < b) {
        return -1
      } else if (a > b) {
        return 1
      }

      return 0
    })

    let i = 0
    let minDiff = Number.MAX_VALUE

    // 逐个比较，包括最后一个和第一个元素，虽然它们相隔最远，但是顺时针可能是最近的
    while (i < sortedTimeList.length) {
      const t1 = timeList[i]
      const t2 = timeList[(i + 1) % sortedTimeList.length]
      const diff = calDiff(t1, t2)

      if (diff < minDiff) {
        minDiff = diff
      }

      i += 1
    }

    return minDiff
  }
}

var calDiff = function (t1, t2) {
  // 24 * 60
  const fullTime = 1440

  const tmp = Math.abs(t1 - t2)
  const diff = Math.min(fullTime - tmp, tmp)

  return diff
}

const timePoints = ["01:00", "12:22", "00:00", "00:30", "23:59"]
console.log(findMinDifference(timePoints))
console.log(findMinDifference2(timePoints))