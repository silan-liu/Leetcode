/**
 * @param {number} N
 * @param {number[][]} mines
 * @return {number}
 */
// Time Limit Exceeded
var orderOfLargestPlusSign = function(N, mines) {

    // 预处理 mines
    let map = new Map()
    mines.map((array) => {
        if (array.length === 2) {
            const key = `${array[0]}-${array[1]}`
            map.set(key, true)
        }
    })

    let maxOrder = Math.floor((N - 1) / 2) + 1

    let k = maxOrder
    let i, j
    while (k >= 1) {

        for (i = k - 1; i <= N - k; i++) {
            for (j = k - 1; j <= N - k; j++) {
                // 计算是否满足条件
                if (hasPlusSign(i, j, k, map)) {
                    console.log(i, j)
                    return k
                }
            }
        }

        k -= 1
    }

    return 0
};

var hasPlusSign = function(i, j, k, map) {
     // 计算是否满足条件
     const key = `${i}-${j}`
     if (!map.has(key)) {
         // 左
         let m = j - 1
         while (m >= j - (k - 1)) {
             const key = `${i}-${m}`

             // 为 0，不满足
             if (map.has(key)) {
                 return false
             }
             m -= 1
         }

         // 右
         m = j + 1
         while (m <= j + (k - 1)) {
             const key = `${i}-${m}`

             // 为 0，不满足
             if (map.has(key)) {
                 return false
             }
             m += 1
         }

         // 下
         m = i - 1
         while (m >= i - (k - 1)) {
             const key = `${m}-${j}`

             // 为 0，不满足
             if (map.has(key)) {
                 return false
             }
             m -= 1
         }

         // 下
         m = i + 1
         while (m <= i + (k - 1)) {
             const key = `${m}-${j}`

             // 为 0，不满足
             if (map.has(key)) {
                 return false
             }
             m += 1
         }

         return true
     }

     return false
}

const N = 5, mines = [[0,0],[0,1],[0,2],[0,3],[0,4],
[1,0],[1,1],[1,3],[1,4],
[2,0],[2,4],
[3,0],[3,1],[3,4],
[4,0],[4,1],[4,3],[4,4]]
console.log(orderOfLargestPlusSign(N, mines))