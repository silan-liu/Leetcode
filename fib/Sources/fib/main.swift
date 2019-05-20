// https://leetcode.com/problems/fibonacci-number/submissions/
class Solution {
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
    
    // 非递归, 98.5
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
print(s.fib2(3))
