/**
 * @param {number[]} pushed
 * @param {number[]} popped
 * @return {boolean}
 */
// https://leetcode.com/problems/validate-stack-sequences/
// 70.79%
var validateStackSequences = function(pushed, popped) {
    let list = new Array()
    let i = 0
    let j = 0

    while (i < pushed.length) {
        // 相等，不需要 push
        if (pushed[i] === popped[j]) {
            j += 1

            // 判断 list 栈顶是否可以出栈
            while (list.length > 0 && (list[list.length - 1] === popped[j])) {
                list.pop()
                j += 1
            }
        } else {
            list.push(pushed[i])
        }

        i += 1
    }

    if (list.length === 0) {
        return true
    }

    return false
};

const pushed = [1,2,3,4,5], popped = [1,2,3,4,5]
console.log(validateStackSequences(pushed, popped))