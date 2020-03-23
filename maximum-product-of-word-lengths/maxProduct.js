/**
 * @param {string[]} words
 * @return {number}
 */
var maxProduct2 = function(words) {
    let map = new Map()
    let i = 0
    while (i < words.length) {
        const word = words[i]

        let j = 0
        while (j < word.length) {
            const ch = word[j]

            let list
            if (map.has(ch)) {
                list = map.get(ch)
            } else {
                list = new Set()
                map.set(ch, list)
            }

            list.add(word)

            j += 1
        }

        i += 1
    }

    console.log(map)
};

// 51.58%
var maxProduct = function(words) {
    let maxLen = 0
    let i = 0
    while (i < words.length - 1) {

        const word1 = words[i]

        let j = i + 1
        while (j < words.length) {

            const word2 = words[j]

            if (!hasCommonLetter(word1, word2)) {
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

var hasCommonLetter = function(word1, word2) {
    if (word1 && word2) {
        let i = 0
        while (i < word1.length) {
            if (word2.includes(word1[i])) {
                return true
            }
            i += 1
        }
    }

    return false
}

const words = ["a","aa","aaa","aaaa"]
console.log(maxProduct(words))