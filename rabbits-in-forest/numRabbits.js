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

const answers = [10, 10, 10, 2, 3,4,3,3,2,1,2,1]
console.log(numRabbits(answers))