/**
 * @param {number[]} customers
 * @param {number[]} grumpy
 * @param {number} X
 * @return {number}
 */
// https://leetcode.com/problems/grumpy-bookstore-owner/
// 68.48%
var maxSatisfied = function(customers, grumpy, X) {
    if (customers && grumpy) {
        let i = 0
        let xSum = 0
        let maxXSum = 0

        // 记录 grumpy = 0 时，客户的总数
        let sum = 0

        // 首先计算出前 X 个数中 grumpy = 1，对应的客户总数
        while (i < X) {
            if (grumpy[i] === 1) {
                xSum += customers[i]
            } else {
                sum += customers[i]
            }
            i += 1
        }

        maxXSum = xSum

        while (i < customers.length) {
            const lastIndex = i - X
            if (grumpy[i] === 0) {
                sum += customers[i]
            }

            let num = grumpy[i] === 0 ? 0 : customers[i]
            let lastNum = grumpy[lastIndex] === 0 ? 0 : customers[lastIndex]

            xSum += num - lastNum

            if (maxXSum < xSum) {
                maxXSum = xSum
            }

            
            i += 1
        }

        return sum + maxXSum
    }

    return 0
};

const customers = [3], grumpy = [1], X = 1
console.log(maxSatisfied(customers, grumpy, X))