// https://leetcode.com/problems/spiral-matrix-iii/submissions/
class Solution {
    func spiralMatrixIII(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
        var result = [[Int]]()

        var r1 = r0
        var c1 = c0

        var n = 0
        var i = 0

        // 起点
        result.append([r1, c1])

        // 顺时针转，右和下的长度一样，往右的时候+1；左和上的长度一样，往左的时候+1。。
        while (result.count < R * C) {
            // 向右
            n += 1
            i = 0
            while i < n {
                c1 += 1

                if r1 >= 0, r1 < R, c1 >= 0, c1 < C {
                    result.append([r1, c1])
                }

                i += 1
            }

            // 向下
            i = 0
            while i < n {
                r1 += 1
                if r1 >= 0, r1 < R, c1 >= 0, c1 < C {
                    result.append([r1, c1])
                }

                i += 1
            }

            // 向左
            n += 1
            i = 0
            while i < n {
                c1 -= 1
                if r1 >= 0, r1 < R, c1 >= 0, c1 < C {
                    result.append([r1, c1])
                }

                i += 1
            }

            // 向上
            i = 0
            while i < n {
                r1 -= 1
                if r1 >= 0, r1 < R, c1 >= 0, c1 < C {
                    result.append([r1, c1])
                }

                i += 1
            }
        }

        return result
    }
}

let s = Solution()
let R = 5, C = 6, r0 = 1, c0 = 4
print(s.spiralMatrixIII(R, C, r0, c0))