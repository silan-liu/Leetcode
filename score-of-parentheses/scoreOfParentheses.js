// https://leetcode.com/problems/score-of-parentheses/
/**
 * @param {string} S
 * @return {number}
 */
// 96.23%
var scoreOfParentheses = function(S) {
    return dfs(0, S.length - 1, S)
};

var dfs = function(l, r, S) {
    if (l < r && r < S.length) {

        // 从 l 开始遍历，寻找最右匹配 )
        let start = l
        let i = l
        let list = []
        let sum = 0
        while (i <= r) {
            if (S[i] === '(') {
                list.push(S[i])

            } else if (S[i] === ')') {

                list.pop()

                if (list.length === 0) {
                    if (i - start === 1) {
                        sum += 1
                    } else {
                        sum += 2 * dfs(start + 1, i - 1, S)
                    }

                    start = i + 1
                }
            }

            i += 1
        }

        return sum
    }
    
    return 0
}

// 使用栈的方式
var scoreOfParentheses2 = function(S) {
    let stack = new Array()
    stack.push(0)

    let i = 0
    while (i < S.length) {
        if (S[i] === '(') {
            stack.push(0)
        } else {
            // 计算分数
            const cur = stack.pop()
            const pre = stack.pop()

            const score = pre + Math.max(2 * cur, 1)
            stack.push(score)
        }

        i += 1
    }

    return stack[0]
};

// 使用树形结构计算
var scoreOfParentheses3 = function(S) {
    let i = 0
    let sum = 0
    let layer = 0
    while (i < S.length) {
        if (S[i] === '(') {
            layer += 1
        } else {
            layer -= 1
        }

        // 最小原子字符串 ()，根据层数计算分数
        if (S[i] === ')' && S[i - 1] === '(') {
            sum += 1 << layer
        }
        i += 1
    }

    return sum
}

const S = '(()((())))((()((()))))(()((())))()(())(())(())(()())'
console.log(scoreOfParentheses(S))
console.log(scoreOfParentheses2(S))
console.log(scoreOfParentheses3(S))