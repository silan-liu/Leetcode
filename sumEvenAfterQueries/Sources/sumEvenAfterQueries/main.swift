// https://leetcode.com/problems/sum-of-even-numbers-after-queries/submissions/
class Solution {
    // 7.48%
    func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
        var tmp = A
        var result = [Int]()
        var initSum = sumOfEvenValue(A)
        
        for query in queries {
            if query.count == 2 {
                let val = query[0]
                let index = query[1]
                
                if index >= 0, index < tmp.count {
                    let oldValue = tmp[index]
                    let newValue = tmp[index] + val
                    
                    // 相加之和为偶数
                    if newValue % 2 == 0 {
                        // 原来的数为偶数，只需加新增部分
                        if oldValue % 2 == 0 {
                            initSum += val
                        } else {
                            initSum += newValue
                        }
                    } else {
                        if oldValue % 2 == 0 {
                            initSum -= oldValue
                        }
                    }
                    
                    tmp[index] = newValue
                    
                    result.append(initSum)
                }
            }
        }
        
        return result
    }
    
    func sumEvenAfterQueries2(_ A: [Int], _ queries: [[Int]]) -> [Int] {
        var tmp = A
        var result = [Int]()
        var initSum = sumOfEvenValue(A)
        
        for query in queries {
            if query.count == 2 {
                let val = query[0]
                let index = query[1]
                
                if index >= 0, index < tmp.count {
                    let oldValue = tmp[index]
                    let newValue = tmp[index] + val
                    
                    // 如果原来是偶数，先减掉。如果新值为奇数，减掉了，就不用处理。
                    if oldValue % 2 == 0 {
                        initSum -= oldValue
                    }
                    
                    // 新值为偶数，加上
                    if newValue % 2 == 0 {
                        initSum += newValue
                    }
                    
                    tmp[index] = newValue
                    
                    result.append(initSum)
                }
            }
        }
        
        return result
    }
    
    // 计算数组中的偶数和
    func sumOfEvenValue(_ A: [Int]) -> Int {
        var sum = 0
        for num in A {
            if num % 2 == 0 {
                sum += num
            }
        }
        
        return sum;
    }
}

let s = Solution()
let A = [1,2,3,4], queries = [[1,0],[-3,1],[-4,0],[2,3]]

print(s.sumEvenAfterQueries(A, queries))
print(s.sumEvenAfterQueries2(A, queries))
