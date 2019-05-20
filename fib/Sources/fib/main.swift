// https://leetcode.com/problems/fibonacci-number/submissions/
class Solution {
    var map = [Int: Int]()

    // 递归 13.03%
    func fib(_ N: Int) -> Int {
        if N == 0 {
            return 0
        } else if N == 1 {
            return 1
        } else{
            return fib(N - 1) + fib(N - 2)
        }
    }
    
    // 递归，100.00%
    func fib3(_ N: Int) -> Int {

        return fib_cache(N)
    }
    
    // 对递归进行优化，缓存已计算的值
    func fib_cache(_ N: Int) -> Int {
        
        if N == 0 {
            return 0
        } else if N == 1 {
            return 1
        } else{
            if let value = map[N] {
                return value
            }
            
            let reuslt = fib_cache(N - 1) + fib_cache(N - 2)
            map[N] = reuslt
            return reuslt
        }
    }
    
    // 非递归, 98.5%
    func fib2(_ N: Int) -> Int {
        
        if N == 0 {
            return 0
        } else if N == 1 {
            return 1
        }
        
        var f0 = 0
        var f1 = 1
        
        var i = 2
        while i <= N {
            let result = f0 + f1
            f0 = f1
            f1 = result
            
            i += 1
        }
        
        return f1
    }
}

let s = Solution()
print(s.fib(10))
print(s.fib3(20))
print(s.fib2(3))
