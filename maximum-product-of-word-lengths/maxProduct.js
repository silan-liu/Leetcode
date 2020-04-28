/**
 * @param {string[]} words
 * @return {number}
 */
// 51.58%
var maxProduct2 = function(words) {
    let map = new Map()
    let i = 0
    while (i < words.length) {
        const word = words[i]

        let subMap = new Map()
        map.set(word, subMap)
        let j = 0
        while (j < word.length) {
            const ch = word[j]
            subMap.set(ch, 1)

            j += 1
        }

        i += 1
    }

    let maxLen = 0
    i = 0
    while (i < words.length - 1) {

        const word1 = words[i]

        let j = i + 1
        while (j < words.length) {

            const word2 = words[j]

            if (!hasCommonLetter2(word1, word2, map)) {
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
};

var hasCommonLetter2 = function(word1, word2, map) {
    if (map.has(word2)) {
        
        const subMap = map.get(word2)
        let i = 0

        while (i < word1.length) {
            const ch = word1[i]
    
            if (subMap.has(ch)) {
                return true
            }

            i += 1
        }
    }

    return false
}

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
console.log(maxProduct2(words))
