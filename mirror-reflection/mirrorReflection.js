// https://leetcode.com/problems/mirror-reflection/
/**
 * @param {number} p
 * @param {number} q
 * @return {number}
 */
var mirrorReflection = function(p, q) {
    if (p >= q) {
        if (p === q) {
            return 1
        }

        if (p === 2 * q) {
            return 2
        }

        // 已知距离
        let l = (p - q)
        let ratio = p / q

        let x = 0
        let cur = 1
        let flag = true

        // 1 - 逆时针，0 - 顺时针
        let direction = 1

        while (x != p) {
            if (flag) {
                if (direction === 1) {
                    cur = (cur + 1) % 4
                 } else {
                     cur = (cur + 3) % 4
                 }
            }

            if (cur % 2 === 1) {
                x = l / ratio
            } else {
                x = l * ratio
            }
            
            if (x > p) {
                l = x - p
                
                if (direction === 1) {
                    cur = (cur + 1) % 4
                 } else {
                    cur = (cur + 3) % 4
                }
                
                // 计算已知距离
                // if (cur % 2 === 1) {
                //     l = l / ratio
                // } else {
                //     l = l * ratio
                // }

                flag = false

                // 如果超出，方向相反
                direction = (direction + 1) % 2

            } else if (x < p) {
                l = p - x
                flag = true
            } else {
                if (direction === 1) {
                    cur = cur % 4
                } else {
                    cur = (cur + 3) % 4
                }
            }

            console.log(cur, x, l, direction)
        }

        return cur
    }

    return -1
};

const p = 5, q = 2
console.log(mirrorReflection(p, q))