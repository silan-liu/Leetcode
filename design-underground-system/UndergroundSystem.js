
// https://leetcode.com/problems/design-underground-system/submissions/
// 93.28%
var UndergroundSystem = function () {

};

UndergroundSystem.prototype.customerMap = new Map()
UndergroundSystem.prototype.stationMap = new Map()


/** 
 * @param {number} id 
 * @param {string} stationName 
 * @param {number} t
 * @return {void}
 */
UndergroundSystem.prototype.checkIn = function (id, stationName, t) {

  let checkInfo = {
    startStation: stationName,
    startTime: t
  }

  // 记录进入信息
  this.customerMap.set(id, checkInfo)
};

/** 
 * @param {number} id 
 * @param {string} stationName 
 * @param {number} t
 * @return {void}
 */
UndergroundSystem.prototype.checkOut = function (id, stationName, t) {

  if (this.customerMap.has(id)) {
    // 如果有进入过
    const checkInInfo = this.customerMap.get(id)
    if (checkInInfo) {
      const { startStation, startTime } = checkInInfo

      // 起始点
      const stationKey = `${startStation}-${stationName}`

      // 时间间隔
      const interval = t - startTime

      const stationInfo = {
        id,
        interval
      }

      // 记录起始点对应的信息
      let list
      if (this.stationMap.has(stationKey)) {
        list = this.stationMap.get(stationKey)
      } else {
        list = new Array()
      }

      list.push(stationInfo)
      this.stationMap.set(stationKey, list)
    }
  } else {
    console.log('error! no checkIn')
  }
};

/** 
 * @param {string} startStation 
 * @param {string} endStation
 * @return {number}
 */
UndergroundSystem.prototype.getAverageTime = function (startStation, endStation) {
  const stationKey = `${startStation}-${endStation}`
  if (this.stationMap.has(stationKey)) {
    const list = this.stationMap.get(stationKey)
    if (list.length > 0) {
      // 计算总时间
      let totalTime = 0
      list.map((info) => {
        totalTime += info.interval
      })

      return totalTime / list.length
    }
  }

  return 0
};

var obj = new UndergroundSystem()
obj.checkIn(45, 'Leyton', 3)
obj.checkIn(32, 'Paradise', 8)
obj.checkIn(27, 'Leyton', 10)
obj.checkOut(45, 'Waterloo', 15)
obj.checkOut(27, 'Waterloo', 20)
obj.checkOut(32, 'Cambridge', 22)

console.log(obj.getAverageTime('Paradise', 'Cambridge'))
console.log(obj.getAverageTime('Leyton', 'Waterloo'))

obj.checkIn(10, 'Leyton', 24)

console.log(obj.getAverageTime('Leyton', 'Waterloo'))

obj.checkOut(10, 'Waterloo', 38)

console.log(obj.getAverageTime('Leyton', 'Waterloo'))


