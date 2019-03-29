// https://leetcode.com/problems/pancake-sorting/submissions/
class Solution {
    
    func pancakeSort(_ A: [Int]) -> [Int] {
        // 先把最大的放在最后
        var tmp = A
        var result = [Int]()

        while tmp.count > 1 {
            let (_, maxIndex) = maxNum(tmp)

            // 最大数在中间
            if maxIndex != tmp.count - 1 {
                if (maxIndex > 0) {
                    // 把前面maxIndex个数flip
                    result.append(maxIndex + 1)
                    tmp = flip(tmp, maxIndex + 1)
                }

                print(tmp)

                // 把整个tmp.count进行flip
                result.append(tmp.count)
                tmp = flip(tmp, tmp.count)

                print(tmp)
            }

            tmp = Array(tmp[0..<tmp.count - 1])

            print(tmp)
        }
                
        return result
    }

    // 最大数，返回（max,maxIndex）
    func maxNum(_ A: [Int]) -> (Int, Int) {
        var i = 0
        var index = 0
        var max = Int.min

        while i < A.count {

            if A[i] >= max {
                max = A[i]
                index = i
            }

            i += 1
        }

        return (max, index)
    }
    
    func flip(_ A: [Int], _ k: Int) -> [Int] {
        if k <= A.count {
            var list = [Int]()
            
            var i = k - 1
            while i >= 0, i < A.count {
                list.append(A[i])
                i -= 1
            }
            
            i = k
            while i < A.count {
                list.append(A[i])
                i += 1
            }
            
            return list
        }
        
        return A
    }
}

let s = Solution()
let A = [3,2,4,1]
print(s.pancakeSort(A))
