// https://leetcode.com/problems/exclusive-time-of-functions/
/**
 * @param {number} n
 * @param {string[]} logs
 * @return {number[]}
 */
// 7.83%
var exclusiveTime = function (n, logs) {
  if (logs.length <= 1) {
    return []
  }

  var result = new Array()

  let i = 0
  while (i < n) {
    result.push(0)
    i += 1
  }

  // 记录未结束的函数
  let logIds = new Array()

  let preLogInfo = logs[0].split(':')
  if (preLogInfo[1] === 'start') {
    logIds.push(preLogInfo[0])
  }

  i = 1
  while (i < logs.length) {
    const log = logs[i]

    // 解析
    const logInfo = log.split(':')
    let period = 0

    // 操作符相同，start - start , end - end
    if (preLogInfo[1] === logInfo[1]) {
      period = logInfo[2] - preLogInfo[2]
    } else {
      // start - end 的情况
      if (preLogInfo[1] === 'start') {
        period = logInfo[2] - preLogInfo[2] + 1
      } else {
        // end - start 情况，前一个未 end 的函数有机会执行
        period = logInfo[2] - preLogInfo[2] - 1
      }
    }

    // 前一个未 end 的函数
    if (logIds.length > 0) {
      const last = logIds[logIds.length - 1]
      result[last] += period
    }

    if (logInfo[1] === 'end') {
      if (logInfo[0] === logIds[logIds.length - 1]) {
        logIds.pop()
      } else {
        // 函数的 start - end 未配对
        console.log('log error')
        break
      }
    } else {
      // 将 start 函数记录
      logIds.push(logInfo[0])
    }

    preLogInfo = logInfo

    i += 1
  }

  return result
};

const n = 2
const logs = ["0:start:0", "1:start:2", "1:end:3", "0:end:4"]

console.log(exclusiveTime(n, logs))