// https://leetcode.com/problems/factorial-trailing-zeroes/submissions/
// 最主要找到因子5的个数，2的个数不用担心，能凑够。
// 如果n = 25,能被5整除的数为25/5=5,这一轮中因子5的个数为5。(5,10,15,20,25)
// 而由于25可以分解成5*5，所以其实还多一个。
func trailingZeroes(_ n: Int) -> Int {
    var factor = 5
    var count = 0
    while n / factor != 0 {
        count += n / factor
        factor *= 5
    }
    
    return count
}

let n = 30
print(trailingZeroes(n))
