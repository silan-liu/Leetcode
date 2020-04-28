// https://leetcode.com/problems/letter-tile-possibilities/submissions/
/**
 * @param {string} tiles
 * @return {number}
 */
var numTilePossibilities = function(tiles) {
    if (!tiles || tiles.length === 0) {
        return 0
    }

    // 计算每个字符的个数
    let countMap = new Map()
    let i = 0
    while (i < tiles.length) {
        const ch = tiles[i]
        if (!countMap.has(ch)) {
            countMap.set(ch, 1)
        } else {
            let count = countMap.get(ch)
            countMap.set(ch, count + 1)
        }

        i += 1
    }

    const keys = [...countMap.keys()]

    // 以类似[{'A':1, 'B':1}] 表示当只有一个字符时的初始值
    let lastList = new Array()

    keys.forEach(key => {
        let map = new Map()
        map.set(key, 1)

        lastList.push(map)
    });

    let nums = keys.length
    let j = 1

    // 组合的字符数逐渐增加，2，3，4 ... tiles.length
    while (j < tiles.length) {
        let l = 0
        let list = []

        // key 依次组合 lastList 的各个元素，最重要的是个数是否足够
        while (l < keys.length) {

            const ch = keys[l]
            const count = countMap.get(ch)
            let k = 0

            while (k < lastList.length) {
                let map = lastList[k]

                // 如果不存在，即可以组合
                if (!map.has(ch)) {
                    
                    const newMap = new Map(map)

                    newMap.set(ch, 1)
                    list.push(newMap)

                } else if (map.get(ch) + 1 <= count) {
                    // ch 个数小于总个数，也可以组合
                    const newMap = new Map(map)

                    newMap.set(ch, map.get(ch) + 1)
                    list.push(newMap)
                }

                k += 1
            }

            l += 1
        }

        lastList = list
        nums += lastList.length
        
        j += 1
    }

    return nums
};

const titles = "AABBCCDD"
console.log(numTilePossibilities(titles))