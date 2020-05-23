/**
 * @param {string} input
 * @return {number[]}
 */
// https://leetcode.com/problems/different-ways-to-add-parentheses/
// 未加缓存，18.49%

// 缓存结果，21.01%
var map = new Map()

var diffWaysToCompute = function(input) {
    if (input && input.length > 0) {
        if (includeOp(input)) {
            const result = recursive(input, 0, input.length - 1)
            return result
        } else {
            const num = parseInt(input)
            return [num]
        }
    }

    return []
};

var includeOp = function (input) {
    if (input.includes('+') || input.includes('-') || input.includes('*')) {
        return true
    }

    return false
}

var recursive = function (input, start, end) {
    if (start < 0 || end > input.length || start > end) {
        return []
    }

    const substr = input.slice(start, end + 1)
    if (map.has(substr)) {
        return map.get(substr)
    }

    // 不包括操作符，说明是数字
    if (!includeOp(substr)) {
        const num = parseInt(substr)
        map.set(substr, [num])
        return [num]
    } else {
        // 找操作符
        let resultList = []
        let i = start
        while (i <= end) {
            const op = input[i]
            if (op === '+' || op === '-' || op === '*') {
                const leftPartResult = recursive(input, start, i - 1)
                const rightPartResult = recursive(input, i + 1, end)

                const opFunc = opMap[op]

                // 两个数组做运算
                leftPartResult.forEach(left => {
                    rightPartResult.forEach(right => {
                        const result = opFunc(left, right)
                        resultList.push(result)
                    })
                });
            }

            i += 1
        }

        // 缓存
        map.set(substr, resultList)

        return resultList
    }
}

// 67.23%，不显示判断数字
var diffWaysToCompute2 = function(input) {
    if (input && input.length > 0) {
        const result = recursive(input, 0, input.length - 1)
        return result
    }

    return []
};

var recursive2 = function (input, start, end) {
    if (start < 0 || end > input.length || start > end) {
        return []
    }

    const substr = input.slice(start, end + 1)
    if (map.has(substr)) {
        return map.get(substr)
    }

    let resultList = []
    let i = start
    while (i <= end) {
        const op = input[i]
        if (op === '+' || op === '-' || op === '*') {
            const leftPartResult = recursive(input, start, i - 1)
            const rightPartResult = recursive(input, i + 1, end)

            const opFunc = opMap[op]

            // 两个数组做运算
            leftPartResult.forEach(left => {
                rightPartResult.forEach(right => {
                    const result = opFunc(left, right)
                    resultList.push(result)
                })
            });
        }

        i += 1
    }

    // 说明是数字
    if (resultList.length === 0) {
        resultList.push(parseInt(substr))
    }
    
    // 缓存
    map.set(substr, resultList)

    return resultList
}

var multiply = function (a, b) {
    return a * b
}

var add = function (a, b) {
    return a  + b
}

var sub = function (a, b) {
    return a - b
}

var opMap = {
    '+': add,
    '-': sub,
    '*': multiply
}

const input = "10"
console.log(diffWaysToCompute(input))
console.log(diffWaysToCompute2(input))
