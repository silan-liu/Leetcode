// https://leetcode.com/problems/sort-characters-by-frequency/submissions/
/**
 * @param {string} s
 * @return {string}
 */
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

    const sortedMap = new Map([...map].sort((a, b) => {
        return b[1] - a[1]
    }))

    let str = ''
    sortedMap.forEach((value, key) => {
        let j = 0
        while (j < value) {
            str += key
            j += 1
        }
    })

    return str
};

const s = "aavvbn"
frequencySort(s)