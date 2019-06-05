// https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/submissions/
class Solution {
    func removeDuplicates(_ S: String) -> String {
        var list = Array(S)
        
        // 从后往前
        var i = list.count - 1
        while i >= 1 {
            if list[i - 1] == list[i] {
                // 删除
                list.remove(at: i)
                list.remove(at: i - 1)
                
                // abba，i = 2, 比如 bb 删除后，aa 也可以删除，此时 i = 1，向前移动 1 位。
                // abb，i= 2，如果是最后的字符，则只能往前移动 2 位。
                if i - 1 >= list.count {
                    i = i - 2
                } else {
                    i = i - 1
                }
            } else {
                i -= 1
            }
        }
        
        return String(list)
    }
}

let s = Solution()
let str = "aa"
print(s.removeDuplicates(str))
