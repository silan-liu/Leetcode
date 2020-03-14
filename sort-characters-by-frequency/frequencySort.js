// https://leetcode.com/problems/sort-characters-by-frequency/submissions/
/**
 * @param {string} s
 * @return {string}
 */
// 69.06%
var frequencySort = function(s) {
    let map = new Map()
    let i = 0
    while (i < s.length) {
        if (map.has(s[i])) {
            const count = map.get(s[i])
            map.set(s[i], count + 1)
        } else {
            map.set(s[i], 1)
        }

        i += 1
    }

    // map 根据 value 从大到小排序
    const sortedMap = new Map([...map].sort((a, b) => {
        return b[1] - a[1]
    }))

    let str = ''
    sortedMap.forEach((value, key) => {
        let j = 0
        // 拼字符串
        while (j < value) {
            str += key
            j += 1
        }
    })

    return str
};

// 45.12%
// 不排序
var frequencySort2 = function(s) {
    let map = new Map()
    let i = 0
    let maxCount = -1
    while (i < s.length) {
        let count = 1
        if (map.has(s[i])) {
            count = map.get(s[i]) + 1
        }

        map.set(s[i], count)

        if (count > maxCount) {
            maxCount = count
        }

        i += 1
    }

    // 数组
    let frequencyList = new Array()
    let j = 0
    while (j < maxCount + 1) {
        frequencyList.push("")
        j += 1
    }

    // 以频次作为下标
    map.forEach((value, key) => {
        let totalString = frequencyList[value]

        let k = 0
        let str = ""
        while (k < value) {
            str += key
            k += 1
        }

        totalString += str
        frequencyList[value] = totalString
    })

    // 倒序遍历，即频次最高的在前
    let result = ""
    let k = frequencyList.length - 1
    while (k >= 0) {
        result += frequencyList[k]
        k -= 1
    }

    return result
};

const s = "aavvbn"
frequencySort(s)
frequencySort2(s)