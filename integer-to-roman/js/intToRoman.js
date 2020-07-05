// https://leetcode.com/problems/integer-to-roman/
/**
 * @param {number} num
 * @return {string}
 */
// 93.52%
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
        const count = Math.floor(num / key);

        // 取对应罗马符号
        const romanSymbol = numMap[key];

        let j = 0;
        while (j < count) {
          roman += romanSymbol;

          j += 1;
        }

        // 减去已计算的数
        num -= key * count;
        break;
      }

      i += 1;
    }
  }

  return roman;
};

// 97.30%
var intToRoman2 = function (num) {
  // 保存结果字符串
  let roman = "";

  const numArray = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
  const romanArray = [
    "M",
    "CM",
    "D",
    "CD",
    "C",
    "XC",
    "L",
    "XL",
    "X",
    "IX",
    "V",
    "IV",
    "I",
  ];

  let i = 0;
  while (i < numArray.length) {
    const key = numArray[i];

    if (num === 0) {
      break
    }

    if (num >= key) {
      const count = Math.floor(num / key);

      // 取对应罗马符号
      const romanSymbol = romanArray[i];

      let j = 0;
      while (j < count) {
        roman += romanSymbol;

        j += 1;
      }

      // 减去已计算的数
      num -= key * count;
    }

    i += 1;
  }

  return roman;
};

const num = 365;
console.log(intToRoman(num));
console.log(intToRoman2(num));
