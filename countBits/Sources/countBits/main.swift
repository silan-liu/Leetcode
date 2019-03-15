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

// 使用动态规划， f[i] = f[i/2] + i & 1，比如1001, 1000；只需要计算100中1的个数，和末尾是否是1。
class Solution2 {
    func countBits(_ num: Int) -> [Int] {
        var result = [Int]()
        var i = 0
        while i <= num {
            result.append(0)
            i += 1
        }

        i = 1
        while i <= num {
            result[i] = result[i/2] + i & 1
            i += 1
        }

        return result
    }
}

let s = Solution()
let s2 = Solution2()

let num = 10

print(s.countBits(num))
print(s2.countBits(num))