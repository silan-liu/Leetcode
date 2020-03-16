/**
 * @param {number[]} nums
 * @return {number}
 */
// Time Limit Exceeded
var totalHammingDistance = function(nums) {
    let totalDist = 0
    let i = 0
    while (i < nums.length - 1) {
        let j = i + 1
        while (j < nums.length) {
            const dist = hammingDistance(nums[i], nums[j])
            totalDist += dist

            j += 1
        }

        i += 1
    }

    return totalDist
};

function hammingDistance(x, y) {
    let dist = 0
    let val = x ^ y
    while (val > 0) {
        if (val & 1) {
            dist += 1
        }

        val >>= 1
    }

    return dist
}

let i = 0
let nums = new Array()
while (i < 10000) {
    const num = Math.random() * 10 ^ 9
    nums.push(num)
    i += 1
}

// const nums = [4, 2, 10^8, 10^4, 938490834902, 438299, 99, 84783, 0, 283742, 48327492, 81782, 943924, 84324, 43829993]
console.log(totalHammingDistance(nums))