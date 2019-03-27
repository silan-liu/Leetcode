// https://leetcode.com/problems/binary-string-with-substrings-representing-1-to-n/submissions/
/**
 * @param {string} S
 * @param {number} N
 * @return {boolean}
 */
var queryString = function(S, N) {
    var store = ["1"]
    if (!S || N < 1 || !S.includes("1")) {
        return false
    }

    var i = 2
    while (i <= N) {
        let str = store[Math.floor(i/2) - 1] + ((i & 1) ? "1" : "0")
        console.log(str)

        if (!S.includes(str)) {
            return false
        }

        store.push(str)

        i += 1
    }

    return true
};

let S = "1000", N = 4
console.log(queryString(S, N))