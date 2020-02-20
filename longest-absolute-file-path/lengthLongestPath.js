// https://leetcode.com/problems/longest-absolute-file-path/submissions/
/**
 * @param {string} input
 * @return {number}
 */
var lengthLongestPath = function(input) {
    if (input && input.length > 0) {
        const length = input.length

        let maxLength = 0
        let lastDepth = 0

        // 记录每层路径的文件名
        let map = new Map()

        let i = 0
        while (i < length) {
            // 取出文件名
            let name = ''
            while (i < length && input[i] !== '\n') {
                name += input[i]
                i += 1
            }

            // 记录当前深度对应的文件名
            if (name.length > 0) {
                map.set(lastDepth, name)
            }

            // 计算下一个路径深度
            i += 1

            let depth = 0
            while (i < length && input[i] === '\t') {
                depth += 1
                i += 1
            }

            // 当前深度比上次的小，说明当前路径达到最深，计算路径长度。且为文件
            if ((depth <= lastDepth) && (name.includes('.'))) {
                // 从 0 到 lastDepath
                let j = 0
                let sum = 0
                while (j <= lastDepth) {
                    if (map.has(j)) {
                        sum += map.get(j).length
                    }

                    j += 1
                }

                // 加上 '/' 个数
                sum += lastDepth

                if (sum > maxLength) {
                    maxLength = sum
                }
            }

            lastDepth = depth
        }

        return maxLength
    }

    return 0
};

const input = 'dir\n\tfile..x'
console.log(lengthLongestPath(input))