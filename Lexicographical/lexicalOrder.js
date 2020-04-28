// https://leetcode.com/problems/lexicographical-numbers/
/**
 * @param {number} n
 * @return {number[]}
 */
// 1, 10, 101, ..., 109, 11, 111, 112, ..., 119, ... 19, 2, 20, 201, ..., 209, 21, 210, ... 219
var lexicalOrder = function(n) {
    if (n < 1) {
        return []
    }

    // 初始化
    let list = []
    let i = 1
    let count = n >= 9 ? 9 : n
    while (i <= count) {
        list.push(i)
        i += 1
    }

    console.log(list)

    let k = 0

    while (k <= list.length - 1) {
        
        const b = list[k] * 10
        let j = 0

        // 往后数 10 个数
        while (j < 10) {
            if (b + j <= n) {
                list.splice(k + 1 + j, 0, b + j)
            } else {
                break
            }

            j += 1
        }

        k += 1
    }

    return list
};

var lexicalOrder2 = function(n) {
    
}

let list = lexicalOrder(300)
console.log(list)

