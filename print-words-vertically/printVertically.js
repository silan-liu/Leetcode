// https://leetcode.com/problems/print-words-vertically
/**
 * @param {string} s
 * @return {string[]}
 */
// 58.15%
var printVertically = function(s) {
    let i = 0
    let maxLen = 0
    let len = 0

    // 计算单词的最大长度
    while (i <= s.length) {
        if (i === s.length || s[i] === ' ') {

            if (len > maxLen) {
                maxLen = len
            }
            len = 0
        } else {
            len += 1
        }
        
        i += 1
    }

	// 初始化结果数组
    let result = new Array()
    let j = 0
    while (j < maxLen) {
        result.push('')
        j += 1
    }

    let k = 0
    let index = -1
    while (k <= s.length) {
	    // 到末尾或者一个单词结束
        if (k === s.length || s[k] === ' ') {
            // 当前单词长度
            let m = index + 1

            // 如果比最大单词长度短，则补空格
            while (m < maxLen) {
                let list = result[m]
                list += ' '
                result[m] = list

                m += 1
            }

            index = -1

        } else {
	        // 行数
            index += 1
			
			// 取出对应的行
            let list = result[index]
            list += s[k]
            result[index] = list
        }
        
        k += 1
    }

    // 去除末尾空格
    const trimmedResult = result.map(str => {
        return str.trimEnd()
    })

    return trimmedResult
};

// 反向遍历, 97.77%
var printVertically2 = function(s) {
    let result = new Array()

    // 单词
    let word = ''
    
    // 是否是完整单词
    let wordFlag = false

    // 记录已遍历单词最大长度
    let preLen = 0

    // 从末尾遍历
    let i = s.length - 1

    while (i >= 0) {
        
        if (s[i] !== ' ') {
	        // 注意顺序
            word = s[i] + word

            // 一个完整单词
            if (i === 0) {
                wordFlag = true
            }
        } else {
            // 一个完整的单词
            wordFlag = true
        }

        if (wordFlag) {

            // 遍历单词
            let j = 0
            while (j < word.length) {

                let list = ''

                if (result.length <= j) {
                    result.push(list)
                } else {
                    list = result[j]
                }

				// 注意顺序
                list = word[j] + list
                result[j] = list

                j += 1
            }

            // 如果字符串长度小于前面最大字符串长度，需要填补空格
            if (word.length < preLen) {
                let k = 0
                while (k < preLen - word.length) {
                    const m = k + word.length
                    let list = ''

                    if (result.length <= m) {
                        result.push(list)
                    } else {
                        list = result[m]
                    }
    
                    list = ' ' + list
                    result[m] = list
    
                    k += 1
                }
            }

            if (word.length > preLen) {
                preLen = word.length
            }
        
            wordFlag = false
            word = ''
        }

        i -= 1
    }

    return result
}

// 横向填充, 58.36%
var printVertically3 = function(s) {
    if (s && s.length > 0) {
        
        // 分隔单词
        const wordList = s.split(' ')

        if (wordList && wordList.length > 0) {
            let index = 0
            let maxLen = 1
            let result = new Array()

            // 逐步生成行，最大行数为单词的最大长度
            while (index < maxLen) {
                let str = ""
                let i = 0
                let lastIndex = 0
                while (i < wordList.length) {
                    const word = wordList[i]

                    // 同时计算最大长度
                    if (word.length > maxLen) {
                        maxLen = word.length
                    }

                    if (index < word.length) {
                        // 记录单词索引
                        lastIndex = i
                        str += word[index]
                    } else {
                        // 补空格
                        str += " "
                    }

                    i += 1
                }

                index += 1

                // 取子串
                const substr = str.slice(0, lastIndex + 1)
                result.push(substr)
            }

            return result
        }
    }

    return []
}

const S = "how are youkkkks afdjklkjkfs"
console.log(printVertically(S))
console.log(printVertically2(S))
console.log(printVertically3(S))