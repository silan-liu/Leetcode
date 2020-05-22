/**
 * @param {string[]} words
 * @return {number}
 */
// https://leetcode.com/problems/longest-string-chain/

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
    
    // 记录每个单词的可连接长度
    const lengthMap = new Map()

    // 找到 lengthMap 中 vale 的最大值
    let longest = Number.MIN_VALUE

    let i = 0
    while (i < sortedKeys.length) {
        const len = sortedKeys[i]
        const list1 = map.get(len)

        const list2 = map.get(len + 1)

        if (!list2) {
            list1.forEach(word => {
                lengthMap.set(word, 1)
            })

            if (longest < 1) {
                longest = 1
            }
        } else {
    
            list1.forEach(word1 => {
                // 取最大连接长度
                let maxLinkLen = 1
                let flag = false

                list2.forEach(word2 => {
    
                    if (isSatisfied(word1, word2)) {
                        flag = true

                        const linkLen = lengthMap.get(word2)

                        if (maxLinkLen < linkLen) {
                            maxLinkLen = linkLen
                        }
                    }
                })
    
                // 如果有后继
                if (flag) {
                    maxLinkLen += 1
                }
    
                // 记录单词的最大链接长度
                lengthMap.set(word1, maxLinkLen)

                // 更新全局最长链接长度
                if (longest < maxLinkLen) {
                    longest = maxLinkLen
                }
            })
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

// 77.89%，递归方式
var longestStrChain2 = function (words) {
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

    // 长度从大到小排序
    const sortedKeys = [...map.keys()].sort((a, b) => {
        if (a < b) {
            return 1
        } else if (a > b) {
            return -1
        }

        return 0
    })

    // 缓存结果
    let cacheResult = new Map()

    let longest = Number.MIN_VALUE

    // 从最长字符开始计算
    let i = 0
    while (i < sortedKeys.length) {
        const len = sortedKeys[i]
        const list = map.get(len)

        list.forEach(word => {
            const result = dsp(map, word, len + 1, cacheResult)
            if (longest < result) {
                longest = result
            }
        })

        i += 1
    }
  
    return longest
};

// 递归计算
var dsp = function (map, preWord, index, cacheResult) {

    if (cacheResult.has(preWord)) {
        return cacheResult.get(preWord)
    }

    if (map.has(index)) {
        const set = map.get(index)
        let find = false

        let maxLinkLen = Number.MIN_VALUE

        set.forEach(word => {
            if (isSatisfied(preWord, word)) {
                find = true
                const result = dsp(map, word, index + 1, cacheResult)
                if (result > maxLinkLen) {
                    maxLinkLen = result
                }
            }
        });

        if (!find) {
            cacheResult.set(preWord, 1)
            return 1
        } else {
            cacheResult.set(preWord, maxLinkLen + 1)

            return maxLinkLen + 1
        }
    } else { 
        cacheResult.set(preWord, 1)

        return 1
    }
}

// const words = ["kxbvnw","uqjszp","pmukt","aai","aaicwm","mhkzelhyek","cjv","v","uqjjspzpp","aaim","uqjjszp","uqjjspzppd","uqjjspzp","aaicm","pukt","pvmukt","dgdb","aaicwbm","mhkelhyek","jv"]
// const words = ["sgtnz","sgtz","sgz","ikrcyoglz","ajelpkpx","ajelpkpxm","srqgtnz","srqgotnz","srgtnz","ijkrcyoglz"] //
const words = ["ksqvsyq","ks","kss","czvh","zczpzvdhx","zczpzvh","zczpzvhx","zcpzvh","zczvh","gr","grukmj","ksqvsq","gruj","kssq","ksqsq","grukkmj","grukj","zczpzfvdhx","gru"]
console.log(longestStrChain(words))
console.log(longestStrChain2(words))
