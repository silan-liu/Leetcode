

/**
 * @param {number} N
 * @param {number[][]} mines
 * @return {number}
 */
// https://leetcode.com/problems/largest-plus-sign/
var orderOfLargestPlusSign = function(N, mines) {

    // 预处理 mines
    let map = new Map()
    mines.map((array) => {
        if (array.length === 2) {
            const key = `${array[0]}-${array[1]}`
            map.set(key, true)
        }
    })

    let dp = new Array()
    for (let r = 0; r < N; r++) {
        let array = new Array()
        for (let c = 0; c < N; c++) {
            array.push(0)
        }
        dp.push(array)
    }

    let maxOrder = 0
    for (let r = 0; r < N; r++) {
        let len = 0
        // 计算左边
        for (let c = 0; c < N; c++) {
            const key = `${r}-${c}`
            if (map.has(key)) {
                len = 0
            } else {
                len += 1
            }

            dp[r][c] = len
        }

        // 计算右边
        len = 0
        for (c = N - 1; c >= 0; c--) {
            const key = `${r}-${c}`
            if (map.has(key)) {
                len = 0
            } else {
                len += 1
            }

            dp[r][c] = Math.min(len, dp[r][c])
        }
    }

    for (let c = 0; c < N; c++) {
        let len = 0
        // 计算上边
        for (let r = 0; r < N; r++) {
            const key = `${r}-${c}`
            if (map.has(key)) {
                len = 0
            } else {
                len += 1
            }

            dp[r][c] = Math.min(len, dp[r][c])
        }

        // 计算下边
        len = 0
        for (r = N - 1; r >= 0; r--) {
            const key = `${r}-${c}`
            if (map.has(key)) {
                len = 0
            } else {
                len += 1
            }

            dp[r][c] = Math.min(len, dp[r][c])

            // 最后一个方位计算完毕，则可确定该点的 order
            maxOrder = Math.max(maxOrder, dp[r][c])
        }
    }

    return maxOrder
}

const N = 2, mines = [[0, 0],[1,0],[1,1],[0,1]]
console.log(orderOfLargestPlusSign(N, mines))