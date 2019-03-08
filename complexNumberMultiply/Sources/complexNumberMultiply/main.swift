// https://leetcode.com/problems/complex-number-multiplication/submissions/
class Solution {
    func complexNumberMultiply(_ a: String, _ b: String) -> String {
        if a.isEmpty || b.isEmpty {
            return ""
        }

        var listA = a.split(separator: "+")
        var listB = b.split(separator: "+")

        if listA.count == 2, listB.count == 2 {
            var a2NumString = listA[1]
            a2NumString.removeLast()

            var b2NumString = listB[1]
            b2NumString.removeLast()

            if let a1Num = Int(listA[0]), let b1Num = Int(listB[0]), let a2Num = Int(a2NumString), let b2Num = Int(b2NumString) {
                // 计算i前面的数， a1Num * b2Num + a2Num * b1Num
                let i_num = a1Num * b2Num + a2Num * b1Num

                // i^2的数值
                let ii_num = a2Num * b2Num * (-1)

                let num = a1Num * b1Num + ii_num

                let result = String(num) + "+" + String(i_num) + "i"
        
                return result
            }
        }

        return ""
    }
}

let s = Solution()

let a = "2+-4i"
let b = "9+-8i"

print(s.complexNumberMultiply(a, b))