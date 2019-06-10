// https://leetcode.com/problems/groups-of-special-equivalent-strings/submissions/
class Solution {
    // 64.52
    func numSpecialEquivGroups(_ A: [String]) -> Int {
        var map = [String: [String]]()
        for str in A {
            // 转换后的结果相等，则表明满足条件
            let transformString = tansform(str)
            
            if var list = map[transformString] {
                list.append(str)
                map[transformString] = list
            } else {
                map[transformString] = [str]
            }
        }

        return map.values.count
    }
    
    func tansform(_ str: String) -> String {
        if str.count > 0 {
            let array = Array(str)
            var i = 0
            
            // 奇数位置string
            var odd = ""
            
            // 偶数位置string
            var even = ""
            
            // 奇数位置可互换，偶数位置可互换
            while i < array.count {
                if i % 2 == 0 {
                    even += String(array[i])
                } else {
                    odd += String(array[i])
                }
                i += 1
            }
            
            let result = String(odd.sorted() + even.sorted())
            return result
        }
        
        return str
    }
}

let s = Solution()
let A = ["abcd","cdab","adcb","cbad", "abcde", "cbeda"]
print(s.numSpecialEquivGroups(A))
