class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        if num == 0 {
            return false
        }
        
        if num == 1 {
            return true
        }
        
        var tmp = num
        while tmp != 1 {
            if tmp % 4 != 0 {
                return false
            }
            
            tmp = tmp / 4
        }
        
        return true
    }
}

let s = Solution()
print(s.isPowerOfFour(64))
print(s.isPowerOfFour(6))
