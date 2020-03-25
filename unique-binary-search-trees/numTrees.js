/**
 * @param {number} n
 * @return {number}
 */
// https://leetcode.com/problems/unique-binary-search-trees/
var numTrees = function(n) {

    let map = new Map()
    map.set(0, 1)
    map.set(1, 1)
    map.set(2, 2)
    map.set(3, 5)

    const result = recursive(n, map)
    return result
};

// 89.50%
var recursive = function(n, map) {
    if (n >= 0) {
        if (map.has(n)) {
            return map.get(n)
        }

        let i = 1
        let sum = 0
        while (i <= n) {
            sum += recursive(i - 1, map) * recursive(n - i, map)
            i += 1
        }

        map.set(n, sum)

        return sum
    }

    return 0
}

// 47.24%
var recursive2 = function(n, map) {
    if (n >= 0) {
        if (map.has(n)) {
            return map.get(n)
        }

        const len = Math.floor(n / 2)
        let i = 1
        let sum = 0
        while (i <= len) {
            sum += 2 * recursive2(i - 1, map) * recursive2(n - i, map)
            i += 1
        }

        // 奇数
        if (n % 2 === 1) {
            // 单独加上
            sum += recursive2(i - 1, map) * recursive2(n - i, map)
        }

        map.set(n, sum)

        return sum
    }

    return 0
}

console.log(numTrees(20))