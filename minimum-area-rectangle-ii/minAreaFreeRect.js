// https://leetcode.com/problems/minimum-area-rectangle-ii/submissions/
/**
 * @param {number[][]} points
 * @return {number}
 */
var minAreaFreeRect = function(points) {
    let minArea = 0
    let distanceMap = new Map()

    // 计算各点之间的距离的平方，并存储对应的线段，如 1:['x1-y1:x2-y2']，两点之间以 : 连接，单个点的 xy 坐标以 - 连接
    let i = 0
    while (i < points.length - 1) {

        const p1 = points[i]

        let j = i + 1
        while (j < points.length) {

            const p2 = points[j]

            const distance = (p1[0] - p2[0]) * (p1[0] - p2[0]) + (p1[1] - p2[1]) * (p1[1] - p2[1])
            let array
            if (distanceMap.has(distance)) {
                array = distanceMap.get(distance)
            } else {
                array = new Array()
                distanceMap.set(distance, array)
            }

            // 将两个点加入集合
            const formattedPoint = transformPoints(p1, p2)
            array.push(formattedPoint)
            
            j += 1
        }

        i += 1
    }

    console.log(distanceMap)

    // 将 map 按照 key 大小排序
    const keys = distanceMap.keys()
    const keyList = [...keys]

    const sortedKeyList = keyList.sort((a, b) => {
        if (a < b) {
            return -1
        } else if (a === b) {
            return 0
        }
        
        return 1
    })
    
    // 找到满足勾股定理的三个距离，双指针
    if (sortedKeyList && sortedKeyList.length > 0) {
        let k = sortedKeyList.length - 1
        while (k >= 1) {

            const target = sortedKeyList[k]

            let left = 0
            let right = k - 1
            while (left <= right) {
                const leftValue = sortedKeyList[left]
                const rightValue = sortedKeyList[right]
                const sum = leftValue + rightValue
                if (sum < target) {
                    left += 1
                } else if (sum > target) {
                    right -= 1
                } else {
                    // 判断其中的点能否构成矩形
                    if (canBuildRectangle(leftValue, rightValue, target, distanceMap)) {
                        const area = Math.sqrt(leftValue * rightValue)
                        if (minArea === 0 || area < minArea) {
                            minArea = area
                        }
                    }

                    left += 1
                    right -=1
                }
            }

            k -= 1
        }
    }

    return minArea
};

// 将坐标点转换为 x-y 形式
transformPointToString = (point) => {
    if (point && point.length === 2) {
        return `${point[0]}-${point[1]}`
    }
}

// 将 p1, p2 转成 x1-y1:x2-y2 的形式
transformPoints = (p1, p2) => {
    const p1Str = transformPointToString(p1)
    const p2Str = transformPointToString(p2)

    return transformPointsStr(p1Str, p2Str)
}

transformPointsStr = (p1Str, p2Str) => {
    return `${p1Str}:${p2Str}`
}

getPoints = (str) => {
    if (str) {
        let list = str.split(':')
        if (list.length === 2) {
            return list
        }
    }
}

// 计算两点之间的距离，x1-y1, x2-y2
getDistance = (p1Str, p2Str) => {
    if (p1Str && p2Str) {
        // - 分隔
        const p1 = p1Str.split('-')
        const p2 = p2Str.split('-')

        if (p1 && p1.length === 2 && p2 && p2.length === 2) {
            const distance = (p1[0] - p2[0]) * (p1[0] - p2[0]) + (p1[1] - p2[1]) * (p1[1] - p2[1])
            return distance
        }
    }

    return 0
}

// 是否能构成矩形
canBuildRectangle = (sideLen1, sideLen2, diagonalLen, map) => {
    if (sideLen1 > 0 && sideLen2 > 0 && diagonalLen > 0 && map) {
        
        if (!map.has(diagonalLen)) {
            return false
        }

        const diagonalList = map.get(diagonalLen)

        let i = 0

        // 取出 diagonalList 中的两条线段，作为对角顶点，计算出对应的 4 条边
        while (i < diagonalList.length - 1) {
            let j = i + 1

            // 对角线 1
            const diagonal1 = diagonalList[i]

            // 分解出 2 个点
            const pointList1 = getPoints(diagonal1)
            const p1Str = pointList1[0]
            const p2Str = pointList1[1]

            while (j < diagonalList.length) {
                // 对角线 2
                const diagonal2 = diagonalList[j]

                // 分解出 2 个点
                const pointList2 = getPoints(diagonal2)

                const p3Str = pointList2[0]
                const p4Str = pointList2[1]

                // 首先判断 p1p3 == p2p4, p1p4 == p2p3，再判断与给定的边长是否相等
                const d1 = getDistance(p1Str, p3Str)
                const d2 = getDistance(p2Str, p4Str)

                const d3 = getDistance(p1Str, p4Str)
                const d4 = getDistance(p2Str, p3Str)

                console.log(`d1: ${d1}, d2: ${d2}, d3: ${d3}, d4: ${d4}, sideLen1: ${sideLen1}, sideLen2: ${sideLen2}, diagonal: ${diagonalLen}`)
                const isEqualToSide = (d1 === sideLen1 && d3 === sideLen2) || (d1 === sideLen2 && d3 === sideLen1)
                if (d1 === d2 && d3 === d4 && isEqualToSide) {
                    return true
                }

                j += 1
            }

            i += 1
        }
    }

    return false
}

const points = [[28,5],[32,4],[5,24],[5,34],[0,29],[24,6],[28,22],[36,8],[28,16],[24,12],[32,21],[10,29]]
console.log(minAreaFreeRect(points))
