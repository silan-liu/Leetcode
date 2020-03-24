// https://leetcode.com/problems/maximum-product-of-word-lengths/
//  96.88%
var maxProduct = function(words) {
    let maxLen = 0
    const len = words.length
    let mask = new Array()

    let i = 0
    while (i < len) {
        mask.push(0)
        i += 1
    }

    i = 0
    while (i < words.length) {

        const word = words[i]

        let val = 0
        let j = 0
        while (j < word.length) {
            const ch = word[j]
            const dis = ch.charCodeAt() - 'a'.charCodeAt()

            // 将字符对应的位置填上 1
            val |= 1 << (25 - dis)
            j += 1
        }

        mask[i] = val

        i += 1
    }

    i = 0
    while (i < words.length - 1) {

        const word1 = words[i]

        let j = i + 1
        while (j < words.length) {

            const word2 = words[j]

            // 按位与，不存在相同字符，注意加括号
            if ((mask[i] & mask[j]) === 0) {
                const product = word1.length * word2.length
                if (product > maxLen) {
                    maxLen = product
                }
            }

            j += 1
        }

        i += 1
    }

    return maxLen
}

const words = ["abcw","baz","foo","bar","xtdfn","abcdef"]
console.log(maxProduct(words))
