/**
 * @param {string[]} words
 * @return {number}
 */
// https://leetcode.com/problems/longest-string-chain/
let result = 0
let cacheResult = new Map()

// 84.74%
var longestStrChain = function (words) {
    if (!words || words.length === 0) {
        return 0
    }

    let minWordLength = Number.MAX_VALUE
    let map = new Map()
    words.forEach(word => {
        const len = word.length
        if (len < minWordLength) {
            minWordLength = len
        }

        let set
        if (map.has(len)) {
            set = map.get(len)
        } else {
            set = new Set()
            map.set(len, set)
        }

        set.add(word)
    });

    // 从最长字符开始计算
    const sortedKeys = [...map.keys()].sort((a, b) => {
        if (a < b) {
            return 1
        } else if (a > b) {
            return -1
        }

        return 0
    })

    // 记录每层每个单词的可连接长度
    const lengthMap = new Map()

    // 找到 lengthMap 中 vale 的最大值
    let longest = Number.MIN_VALUE

    let i = 0
    while (i < sortedKeys.length) {
        const len = sortedKeys[i]
        const list1 = map.get(len)

        const wordLinkMap = lengthMap.get(len + 1)

        if (!wordLinkMap) {
            const wordLinkMap = new Map()
            list1.forEach(word => {
                wordLinkMap.set(word, 1)
            })

            lengthMap.set(len, wordLinkMap)

            if (longest < 1) {
                longest = 1
            }
        } else {
            const currentWordLinkMap = new Map()
    
            list1.forEach(word1 => {
                // 取最大连接长度
                let maxLinkLen = 1
                let flag = false

                wordLinkMap.forEach((linkLen, word2) => {
    
                    if (isSatisfied(word1, word2)) {
                        flag = true
                        if (maxLinkLen < linkLen) {
                            maxLinkLen = linkLen
                        }
                    }
                })
    
                // 如果有后继
                if (flag) {
                    maxLinkLen += 1
                }
    
                currentWordLinkMap.set(word1, maxLinkLen)
                if (longest < maxLinkLen) {
                    longest = maxLinkLen
                }
            })
    
            lengthMap.set(len, currentWordLinkMap)
        }

        i += 1
    }
  
    return longest
};

// word1 是否能添加一个字符变为 word2
var isSatisfied = function (word1, word2) {
    const len1 = word1.length
    const len2 = word2.length

    if (len1 + 1 === len2) {
        let i = 0
        let j = 0
        let flag = false
        while (i < len1) {
            if (word1[i] !== word2[j]) {
                if (!flag) {
                    flag = true

                    // 说明 word1 在这个位置需要插入该字符，word2 下标后移继续比较
                    j += 1
                } else {
                    // 有第二个不同的字符
                    return false
                }
            } else {
                i += 1
                j += 1
            }
        }

        return true
    }

    return false
}

var recursive = function (map, preWord, index, len) {

    if (map.has(index)) {
        const set = map.get(index)
        let find = false

        set.forEach(word => {

            // 同时从它自身开始找
            recursive(map, word, index + 1, 1)

            if (len === 0 || isSatisfied(preWord, word)) {

                find = true

                recursive(map, word, index + 1, len + 1)
            }
        });

        if (!find) {
            if (len > result) {
                result = len
            }
        }
    } else { 
        if (len > result) {
            result = len
        }
    }
}

/// ["a","b","c","cd","cde","fb","cedq"]
// ["sgtnz","sgtz","sgz","ikrcyoglz","ajelpkpx","ajelpkpxm","srqgtnz","srqgotnz","srgtnz","ijkrcyoglz"] //
const words = ["a","b","c","cd","cde","fb","cdeq"]//["ksqvsyq","ks","kss","czvh","zczpzvdhx","zczpzvh","zczpzvhx","zcpzvh","zczvh","gr","grukmj","ksqvsq","gruj","kssq","ksqsq","grukkmj","grukj","zczpzfvdhx","gru"]
console.log(longestStrChain(words))
