/**
 * @param {string} s
 * @return {string}
 */
// 超时
var longestPalindrome = function (s) {
  if (!s) {
    return "";
  }

  let maxLen = 1;
  let result = s[0];

  let i = 0;
  while (i < s.length - 1) {
    let j = i + 1;
    while (j < s.length) {
      let substr = s.slice(i, j + 1);
      if (isPalindrome(substr)) {
        let len = j - i + 1;
        if (len > maxLen) {
          maxLen = len;
          result = substr;
        }
      }

      j += 1;
    }

    i += 1;
  }

  return result;
};

/**
 * 是否是回文
 */
var isPalindrome = function (s) {
  if (s && s.length > 0) {
    let i = 0;
    let j = s.length - 1;
    while (i < j) {
      if (s[i] !== s[j]) {
        return false;
      } else {
        i += 1;
        j -= 1;
      }
    }
  }

  return true;
};

var longestPalindrome2 = function (s) {
  if (!s) {
    return "";
  }

  // 反转
  const t = s.split("").reverse().join("");

  return longestCommonStr(s, t);
};

// 最长公共子串
var longestCommonStr = function (s, t) {
  if (s && t) {
    let maxPalindromeLen = 0;
    let commonStr = "";

    let recordList = new Array();
    let i = 0;
    while (i < s.length) {
      let rows = new Array();
      let j = 0;
      while (j < t.length) {
        if (s[i] === t[j]) {
          let value = 1;
          if (i >= 1 && j >= 1) {
            value = recordList[i - 1][j - 1] + 1;
          }

          if (value > maxPalindromeLen) {
            // 求公共字符串
            const startRow = i - (value - 1);
            const substr = s.slice(startRow, i + 1);

            // 判断是否是回文, 排除 abcdcba 这种情况
            if (isPalindrome(substr) && substr.length > maxPalindromeLen) {
              commonStr = substr;
              maxPalindromeLen = substr.length;
            }
          }

          rows.push(value);
        } else {
          rows.push(0);
        }
        j += 1;
      }

      recordList.push(rows);
      i += 1;
    }

    return commonStr;
  }

  return "";
};

let s = "cbbd";
console.log(longestPalindrome2(s));
