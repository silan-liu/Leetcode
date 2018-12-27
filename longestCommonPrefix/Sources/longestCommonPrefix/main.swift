//https://leetcode.com/problems/longest-common-prefix/submissions/
func longestCommonPrefix(_ strs: [String]) -> String {

    if strs.count == 0 {
        return ""
    }
    
    if strs.count == 1 {
        return strs[0]
    }

    var prefix = ""
    var i = 0

    while true {
        var j = 0
        var char = ""
        while j < strs.count - 1 {
            if i < strs[j].count, i < strs[j+1].count {
                let index = strs[j].index(strs[j].startIndex, offsetBy: i)
                char = String(strs[j][index])
                if strs[j][index] != strs[j+1][index] {
                    return prefix
                }
            } else {
                return prefix
            }

            j += 1
        }

        prefix += String(char)

        i += 1
    }

    return prefix
}

func longestCommonPrefix_2(_ strs: [String]) -> String {

    if strs.count == 0 {
        return ""
    }
    
    if strs.count == 1 {
        return strs[0]
    }

    var prefix = ""
    var i = 0

    while true {
        var j = 0
        var char = ""
        while j < strs.count - 1 {
            if i < strs[j].count, i < strs[j+1].count {
                let list1 = Array(strs[j])
                let list2 = Array(strs[j+1])

                char = String(list1[i])
                
                if list1[i] != list2[i] {
                    return prefix
                }
            } else {
                return prefix
            }

            j += 1
        }

        prefix += String(char)

        i += 1
    }

    return prefix
}

let strs = ["sss"]
print(longestCommonPrefix(strs))