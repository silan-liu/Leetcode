// https://leetcode.com/problems/minimum-area-rectangle/
/**
 * @param {number[][]} points
 * @return {number}
 */
var minAreaRect = function(points) {
    let map = new Map()
    let maxX = Number.MIN_VALUE
    let minArea = 0

    points.forEach((value) => {
        const x = value[0]
        const y = value[1]

        if (x > maxX) {
            maxX = x
        }

        const key = x

        if (map.has(key)) {
            let list = map.get(key)

            // 去重
            if (list.indexOf(y) == -1) {
                list.push(y)
            }

        } else {
            let list = new Array()
            list.push(y)
            map.set(key, list)
        }
    })

    const keys = map.keys()
    let keyList = [...keys]

    // 逐个遍历 key
    let i = 0

    while (i < keyList.length - 1) {
        let key = keyList[i]
        let value = map.get(key)

        let j = i + 1
        while (j < keyList.length) {
            let x = keyList[j]

            const list = map.get(x)
            if (list.length >= 2) {
                // 求交集
                let intersection = value.filter(v => list.includes(v))
                if (intersection.length >= 2) {
                    
                    // 求最小高度
                    let height = minValue(intersection)

                    const area = height * Math.abs(x - key)

                    if (minArea === 0 || area < minArea) {
                        minArea = area
                    }
                }
            }

            j += 1
        }

        i += 1
    }

    return minArea
};

// 求数组相邻元素的最小差值
minValue = (arr) => {
    if (arr && arr.length > 0) {
        const sorted = arr.sort((a, b) => {
            if(a < b){
                return -1
            }
            else if (a > b) {
                return 1
            }
            
            return 0
        })

        const len = sorted.length
        let i = 0
        let min = Number.MAX_VALUE

        while (i < len - 1) {
            let j = i + 1
            while (j < len) {
                const diff = sorted[j] - sorted[i]
                if (diff < min) {
                    min = diff
                }

                j += 1
            }

            i += 1
        }

        return min
    }
}

const points = [[36219,4673],[26311,36047],[26311,4673],[36219,16024],[17010,16024],[26311,6287],[22367,6287],[17010,36047],[17010,6287],[22367,16024],[36219,6287],[22367,4673],[17010,4673],[36219,36047]]
console.log(minAreaRect(points))