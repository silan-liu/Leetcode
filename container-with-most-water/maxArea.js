/**
 * @param {number[]} height
 * @return {number}
 */
// 暴力解法
var maxArea = function(height) {
    let i = 0
    let max = 0

    const length = height.length
    while (i < length - 1) {
        let j = i + 1
        while (j < length) {
            const minHeight = Math.min(height[i], height[j])
            const area = minHeight * (j - i)

            if (area > max) {
                max = area
            }

            j += 1
        }

        i += 1
    }

    return max
};

const height = [1,8,6,2,5,4,8,3,7]
console.log(maxArea(height))