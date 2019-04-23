// https://leetcode.com/problems/minimum-falling-path-sum/submissions/
class Solution {
    
    var minSum = Int.max
    var r = 0
    var c = 0
    var list = [[Int]]()
    
    // 递归超时
    func minFallingPathSum(_ A: [[Int]]) -> Int {
        r = A.count
        if r > 0 {
            list = A
            c = A[0].count
            
            var col = 0
            while col < c {
                recursive(1, col, A[0][col])
                col += 1
            }
        }
        
        return minSum
    }
    
    func recursive(_ row: Int, _ col: Int, _ sum: Int) {
        if row < 0 || row >= list.count {
            if sum < minSum {
                minSum = sum
            }
        } else {
            // 列相隔不超过1
            var j = col - 1
            while j <= col + 1 {
                if j >= 0,  j < c {
                    let tmp = sum + list[row][j]
                    recursive(row + 1, j, tmp)
                }
                
                j += 1
            }
        }
    }
    
    func minFallingPathSum_2(_ A: [[Int]]) -> Int {
        // 采用从底向上计算的方式，计算出每个位置的最小和，一步步往上计算，到第一层时，就已经计算出了所有的最小和，只需要遍历第一行最小的数即可。
        r = A.count
        if r > 0 {
            list = A
            c = A[0].count
            
            var tmp = A
            
            // 从倒数第二行开始计算，因为倒数第一行各个位置的最小和肯定是原值。
            if r >= 2 {
                var i = r - 2
                while i >= 0 {
                    
                    var j = 0
                    
                    // 计算每个位置最小和
                    while j < c {
                        
                        // 最小和
                        var minSum = Int.max
                        
                        // 当前位置的数
                        let n = tmp[i][j]
                        
                        var k = j - 1

                        // 遍历起相邻列，不超过1
                        while k <= j + 1 {
                            
                            if k >= 0, k < c {
                                // 加上它下一行的数
                                let sum = n + tmp[i+1][k]
                                if sum < minSum {
                                    minSum = sum
                                }
                            }
                            
                            k += 1
                        }
                        
                        // 记录最小和
                        tmp[i][j] = minSum
                        
                        j += 1
                    }
                    
                    i -= 1
                }
            }
            
            let firstRow = tmp[0]
            
            var minSum = Int.max
            for n in firstRow {
                if n < minSum {
                    minSum = n
                }
            }
            
            return minSum
        }
        
        return 0
    }
}

let A =
 [[-19,-1,-96,48,-94,36,16,55,-42,37,-59,6,-32,96,95,-58,13,-34,94,85],[17,44,36,-29,84,80,-34,50,-99,64,13,91,-27,25,-36,57,20,98,-100,-72],[-92,-75,86,90,-4,90,64,56,50,-63,10,-15,90,-66,-66,32,-69,-78,1,60],[21,51,-47,-43,-14,99,44,90,8,11,99,-62,57,59,69,50,-69,32,85,13],[-28,90,12,-18,23,61,-55,-97,6,89,36,26,26,-1,46,-50,79,-45,89,86],[-85,-10,49,-10,2,62,41,92,-67,85,86,27,89,-50,77,55,22,-82,-94,-98],[-50,53,-23,55,25,-22,76,-93,-7,66,-75,42,-35,-96,-5,4,-92,13,-31,-100],[-62,-78,8,-92,86,69,90,-37,81,97,53,-45,34,19,-19,-39,-88,-75,-74,-4],[29,53,-91,65,-92,11,49,26,90,-31,17,-84,12,63,-60,-48,40,-49,-48,88],[100,-69,80,11,-93,17,28,-94,52,64,-86,30,-9,-53,-8,-68,-33,31,-5,11],[9,64,-31,63,-84,-15,-30,-10,67,2,98,73,-77,-37,-96,47,-97,78,-62,-17],[-88,-38,-22,-90,54,42,-29,67,-85,-90,-29,81,52,35,13,61,-18,-94,61,-62],[-23,-29,-76,-30,-65,23,31,-98,-9,11,75,-1,-84,-90,73,58,72,-48,30,-81],[66,-33,91,-6,-94,82,25,-43,-93,-25,-69,10,-71,-65,85,28,-52,76,25,90],[-3,78,36,-92,-52,-44,-66,-53,-55,76,-7,76,-73,13,-98,86,-99,-22,61,100],[-97,65,2,-93,56,-78,22,56,35,-24,-95,-13,83,-34,-51,-73,2,7,-86,-19],[32,94,-14,-13,-6,-55,-21,29,-21,16,67,100,77,-26,-96,22,-5,-53,-92,-36],[60,93,-79,76,-91,43,-95,-16,74,-21,85,43,21,-68,-32,-18,18,100,-43,1],[87,-31,26,53,26,51,-61,92,-65,17,-41,27,-42,-14,37,-46,46,-31,-74,23],[-67,-14,-20,-85,42,36,56,9,11,-66,-59,-55,5,64,-29,77,47,44,-33,-77]]
let s = Solution()
//print(s.minFallingPathSum(A))
print(s.minFallingPathSum_2(A))
