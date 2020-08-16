/**
 * @param {string} s
 * @return {string}
 */
// 超时
var longestPalindrome = function (s) {
  if (!s) {
    return ""
  }

  let maxLen = 1
  let result = s[0]

  let i = 0
  while (i < s.length - 1) {
    let j = i + 1
    while (j < s.length) {

      let substr = s.slice(i, j + 1)
      if (isPalindrome(substr)) {
        let len = j - i + 1
        if (len > maxLen) {
          maxLen = len
          result = substr
        }
      }

      j += 1
    }

    i += 1
  }

  return result
};

/**
 * 是否是回文
 */
var isPalindrome = function (s) {
  if (s && s.length > 0) {
    let i = 0
    let j = s.length - 1
    while (i < j) {
      if (s[i] !== s[j]) {
        return false
      } else {
        i += 1
        j -= 1
      }
    }
  }

  return true
}

let s = "abcd"
console.log(longestPalindrome(s))