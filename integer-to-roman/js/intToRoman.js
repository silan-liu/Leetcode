// https://leetcode.com/problems/integer-to-roman/
/**
 * @param {number} num
 * @return {string}
 */
// 56.30%
var intToRoman = function (num) {
  // 保存结果字符串
  let roman = "";

  const numMap = {
    1000: "M",
    900: "CM",
    500: "D",
    400: "CD",
    100: "C",
    90: "XC",
    50: "L",
    40: "XL",
    10: "X",
    9: "IX",
    5: "V",
    4: "IV",
    1: "I",
  };

  const numArray = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
  while (num > 0) {
    let i = 0;
    while (i < numArray.length) {
      const key = numArray[i];
      if (num >= key) {
        // 取对应罗马符号
        const romanSymbol = numMap[key];

        roman += romanSymbol;

        // 减去已计算的数
        num -= key;
        break;
      }

      i += 1;
    }
  }

  return roman;
};

const num = 1002;
console.log(intToRoman(num));
