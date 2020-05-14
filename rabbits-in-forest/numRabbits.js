/**
 * @param {number[]} answers
 * @return {number}
 */
// https://leetcode.com/problems/rabbits-in-forest/
// 12.00% 
var numRabbits = function(answers) {
    if (!answers || answers.length === 0) {
        return 0
    }

    // 用数字 1, 2, ..., 表示兔子的颜色
    let index = 1

    // 记录每种颜色兔子的个数和是否配对, {color: {totalCount: 2, remainCount: 1}}
    let colorMap = new Map()
    let sum = 0

    answers.forEach((answer) => {
        if (answer === 0) {
            sum += 1
        } else {
            // 在 map 中查找是否有某个颜色对应的数量相同的兔子，若有，则表示其为同一个颜色，若无，则表示为其他颜色的兔子
            let found = false
            let i = 0
            while (i <= index) {
                if (colorMap.has(i)) {
                    let value = colorMap.get(i)
                    let {totalCount, remainCount} = value
                    if (totalCount === answer + 1 && remainCount > 0) {
                        found = true

                        // 更新剩余兔子数
                        value.remainCount = remainCount - 1
                        colorMap.set(i, value)
                        break
                    }
                }

                i += 1
            }

            if (!found) {
                // 没有找到，则为一种新颜色的兔子
                const value = {totalCount: answer + 1, remainCount: answer}
                colorMap.set(index, value)
                index += 1
            }
        }
    })

    console.log(colorMap)

    // 计算 colormap 的总数
    colorMap.forEach((value) => {
        sum += value.totalCount
    })

    return sum
};

/**
 * @param {number[]} answers
 * @return {number}
 */
// 68.00%
var numRabbits2 = function (answers) {
    if (!answers || answers.length === 0) {
        return 0
    }

    let sum = 0
    let answerMap = new Map()
    answers.forEach(answer => {
        let list
        if (answerMap.has(answer)) {
            list = answerMap.get(answer)
        } else {
            list = new Array()
        }

        list.push(answer)
        answerMap.set(answer, list)
    })

    console.log(answerMap)

    answerMap.forEach((value, key) => {
        if (key === 0) {
            // 每个兔子都是不同颜色
            sum += value.length
        } else {

            // 取第一个兔子说的数目+1，即为应有的总数
            const totalCount = key + 1
            sum += totalCount

            // 除去第一只兔子，还剩的总数
            let remainCount = key

            // 从第二只兔子开始
            let i = 1
            while (i < value.length) {
                // 剩余兔子数 > 0，则该兔子说的数量可以覆盖
                if (remainCount > 0) {
                    remainCount -= 1
                } else {
                    // 不能覆盖，则需要新增颜色
                    sum += totalCount
                    remainCount = key
                }

                i += 1
            }
        }
    })

    return sum
}

/**
 * @param {number[]} answers
 * @return {number}
 */
// 96.00%
var numRabbits3 = function (answers) {
    if (!answers || answers.length === 0) {
        return 0
    }

    let sum = 0

    // 计算相同答案兔子个数
    let answerMap = new Map()
    answers.forEach(answer => {
        let count
        if (answerMap.has(answer)) {
            count = answerMap.get(answer) + 1
        } else {
            count = 1
        }

        answerMap.set(answer, count)
    })

    answerMap.forEach((value, key) => {
        // 应有的兔子的总数
        const num = key + 1

        // Math.ceil(value / num) 表示应该有几组 num，如果 key = 10，value = 24，说明需要 3 组兔子才能满足，因为第一只兔子说的总数为 11，可以覆盖到前 11 只兔子。第 12 只兔子说的总数为 11，也可以覆盖 11 只，即到 22 只，依次类推。
        sum += num * Math.ceil(value / num)
    })

    return sum
}

const answers = [5, 2, 2, 0, 2, 2, 2]//[10,10,10,2, 3,4,3,3,2,1,2,1,3,2,12,1,2,4,3,32,2,3,2,0,1,0,1,0,0,0]
console.log(numRabbits(answers))
console.log(numRabbits2(answers))
console.log(numRabbits3(answers))
