/**
 * @param {number[]} price
 * @param {number[][]} special
 * @param {number[]} needs
 * @return {number}
 */
var shoppingOffers = function (price, special, needs) {
  const result = recursive(price, needs, special)
  return result
};


var map = new Map()
var recursive = function (price, needs, special) {

  const key = generateKey(needs)

  // 从缓存中取
  if (map.has(key)) {
    return map.get(key)
  }

  // 需求个数全是 0
  if (isOver(needs)) {
    return 0
  } else {

    let i = 0

    // 直接购买
    let minTotalPrice = buy(price, needs)

    while (i < special.length) {
      const offer = special[i]

      let j = 0
      let canBuy = true
      // 新的需求
      let newNeeds = new Array()

      while (j < needs.length) {
        // 商品数不满足
        if (offer[j] > needs[j]) {
          canBuy = false
          break
        } else {
          newNeeds.push(needs[j] - offer[j])
        }

        j += 1
      }

      // 可以购买
      if (canBuy) {
        // 计算新的需求
        const total = recursive(price, newNeeds, special) + offer[offer.length - 1]
        if (total < minTotalPrice) {
          minTotalPrice = total
        }
      }

      i += 1
    }

    // 缓存结果
    map.set(key, minTotalPrice)
    return minTotalPrice
  }
}

// 直接购买
var buy = function (price, needs) {
  let total = 0
  let i = 0
  while (i < needs.length) {
    total += price[i] * needs[i]
    i += 1
  }

  return total
}

// 生成 key
var generateKey = function (needs) {
  if (needs) {
    let i = 0
    let str = ''
    while (i < needs.length) {
      str += needs[i].toString()

      i += 1
    }

    return str
  }
}

// 完成购买
var isOver = function (needs) {

  if (needs) {
    let i = 0
    while (i < needs.length) {
      if (needs[i] !== 0) {
        return false
      }

      i += 1
    }
  }

  return true
}

const price = [2, 3, 4]
const special = [[1, 1, 0, 4], [2, 2, 1, 9]]
const needs = [1, 2, 1]

console.log(shoppingOffers(price, special, needs))