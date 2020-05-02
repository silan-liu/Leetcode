// https://leetcode.com/problems/mirror-reflection/
/**
 * @param {number} p
 * @param {number} q
 * @return {number}
 */
var mirrorReflection = function (p, q) {
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

        // 是否需要计算下一个墙面编号
        let flag = true

        // 1 - 逆时针，0 - 顺时针
        let direction = 1

        // 因为计算有小数点，比较浮点数大小
        while (!isEqual(x, p)) {
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

            // 计算有小数点，比较浮点数大小
            if (isEqual(x, p)) {
                if (direction === 1) {
                    cur = cur % 4
                } else {
                    cur = (cur + 3) % 4
                }
                break
            } else {
                if (x > p) {
                    l = x - p

                    if (direction === 1) {
                        cur = (cur + 1) % 4
                    } else {
                        cur = (cur + 3) % 4
                    }

                    // 下次循环不需要计算墙面编号，因为已经计算过了
                    flag = false

                    // 如果超出，方向相反
                    direction = (direction + 1) % 2

                } else if (x < p) {
                    if (!flag) {
                        l = x
                    } else {
                        l = p - x
                    }

                    flag = true
                }
            }

            // console.log(cur, x, l, direction, flag)
        }

        return cur
    }

    return 0
};

// 比较 x,y 浮点数是否相等
var isEqual = function (x, y) {
    return Math.abs(x - y) < 1e-6
}

// solution2
var gcd = function (a, b) {
    if (a === 0) {
        return b
    }

    return gcd(b % a, a)
}

var mirrorReflection2 = function (p, q) {
    // 最大公约数
    const g = gcd(p, q)

    // 使 m，n 最小
    let m = p / g
    let n = q / g

    if (m % 2 === 1 && n % 2 === 1) {
        return 1
    }

    if (m % 2 === 1) {
        return 0
    }

    return 2
}

const p = 5, q = 3
console.log(mirrorReflection(p, q))
console.log(mirrorReflection2(p, q))