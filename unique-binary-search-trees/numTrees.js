/**
 * @param {number} n
 * @return {number}
 */
// https://leetcode.com/problems/unique-binary-search-trees/
// 递归解法
var numTrees = function(n) {

    // 预设值
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

// 非递归
// 96.56%
var numTrees2 = function(n) {

    let list = new Array()

    // 长度为 n+1
    let i = 0
    while (i <= n) {
        list.push(1)
        i += 1
    }

    // 从 2 开始计算
    i = 2
    while (i <= n) {
        let j = 1
        let sum = 0

        // 分为左右两部分，去除一个顶点，那么左边为 j - 1 个数，右边 i - j 个数
        while (j <= i) {
            sum += list[j - 1] * list[i - j]
            j += 1
        }

        list[i] = sum

        i += 1
    }

    const result = list[n]
    return result
};

console.log(numTrees(200))
console.log(numTrees2(200))