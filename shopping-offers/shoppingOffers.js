/**
 * @param {number[]} price
 * @param {number[][]} special
 * @param {number[]} needs
 * @return {number}
 */
var shoppingOffers = function (price, special, needs) {
  // 将 price 处理为 special
  let i = 0
  let specialOffers = new Array()

  while (i < price.length) {
    let offer = new Array()
    let j = 0
    while (j < price.length) {
      if (j === i) {
        offer.push(1)
      } else {
        offer.push(0)
      }

      j += 1
    }

    offer.push(price[i])
    specialOffers.push(offer)

    i += 1
  }


  i = 0
  while (i < special.length) {
    specialOffers.push(special[i])
    i += 1
  }

  const result = recursive2(needs, specialOffers)
  return result
};


var map = new Map()
var recursive2 = function (needs, special) {
  const key = generateKey(needs)
  if (map.has(key)) {
    return map.get(key)
  }

  if (isOver(needs)) {
    return 0
  } else {
    let i = 0
    let minTotalPrice = Number.MAX_SAFE_INTEGER
    while (i < special.length) {
      const offer = special[i]

      let j = 0
      let canBuy = true
      let newNeeds = new Array()

      while (j < needs.length) {
        if (offer[j] > needs[j]) {
          canBuy = false
          break
        } else {
          newNeeds.push(needs[j] - offer[j])
        }

        j += 1
      }

      if (canBuy) {
        const total = recursive2(newNeeds, special) + offer[offer.length - 1]
        if (total < minTotalPrice) {
          minTotalPrice = total
        }
      }

      i += 1
    }

    map.set(key, minTotalPrice)
    return minTotalPrice
  }
}

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

const price = [0, 0, 0]
const special = [[1, 1, 0, 4], [2, 2, 1, 9]]
const needs = [1, 1, 1]

let specialOffers = new Array()
let i = 0
while (i < 3) {
  let j = 0
  let offer = new Array()
  while (j < 6) {
    const count = Math.floor(Math.random() * 10) % 10
    offer.push(count)
    j += 1
  }

  const price = Math.floor(Math.random() * 100) % 50
  offer.push(price)

  i += 1

  specialOffers.push(offer)
}

console.log(shoppingOffers(price, special, needs))