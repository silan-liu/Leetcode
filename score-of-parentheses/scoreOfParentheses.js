// https://leetcode.com/problems/score-of-parentheses/
/**
 * @param {string} S
 * @return {number}
 */
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

const S = '(()((())))((()((()))))(()((())))()(())(())(())(()())'
console.log(scoreOfParentheses(S))