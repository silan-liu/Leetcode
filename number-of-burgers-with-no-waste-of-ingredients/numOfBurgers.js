/**
 * @param {number} tomatoSlices
 * @param {number} cheeseSlices
 * @return {number[]}
 */
// https://leetcode.com/problems/number-of-burgers-with-no-waste-of-ingredients/submissions/
var numOfBurgers = function(tomatoSlices, cheeseSlices) {
    if (tomatoSlices % 2 === 0) {
        const numberOfBig = tomatoSlices/2 - cheeseSlices
        if (numberOfBig >= 0) {
            const numberOfSmall = cheeseSlices - numberOfBig
            if (numberOfSmall >= 0) {
                return [numberOfBig, numberOfSmall]
            }
        }
    }

    return []
};

const tomatoSlices = 10000000, cheeseSlices = 100999
console.log(numOfBurgers(tomatoSlices, cheeseSlices))