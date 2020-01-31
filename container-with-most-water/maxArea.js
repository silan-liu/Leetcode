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

/**
 * @param {number[]} height
 * @return {number}
 */
var maxArea2 = function(height) {
    let i = 0
    let j = height.length - 1
    let max = 0

    while (i < j) {

        const minHeight = Math.min(height[i], height[j])
        const area = minHeight * (j - i)

        if (area > max) {
            max = area
        }

        // 如果小于，以 i 为基准计算最大面积，那么从 [i,j] 此时其实是最大的，因为如果 j--，那么面积只会越来越小 。为了计算更大的，需要将 i ++。
        if (height[i] < height[j]) {
            i += 1
        } else {
            // 反之，类似
            j -= 1
        }
    }

    return max
};

const height = [1,8,6,2,5,4,8,3,7,8,7,0,6,5,7,2,1]
console.log(maxArea(height))
console.log(maxArea2(height))