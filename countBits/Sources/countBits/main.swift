// https://leetcode.com/problems/counting-bits/submissions/
class Solution {
    func countBits(_ num: Int) -> [Int] {
        var i = 0
        var result = [Int]()
        while i <= num {
            let count = numberOf1(i)
            result.append(count)
            i += 1
        }

        return result
    }

    // 二进制中1的个数
    func numberOf1(_ num: Int) -> Int {
        var tmp = num
        var count = 0
        while tmp != 0 {
            count += 1
            // 将最后一个1置为0
            tmp &= (tmp - 1)
        }

        return count
    }
}

let s = Solution()
let num = 2

print(s.countBits(num))