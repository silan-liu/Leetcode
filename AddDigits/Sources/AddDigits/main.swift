print("Hello, world!")

// 常规做法
func addDigits(_ num: Int) -> Int {
    if num >= 0 && num <= 9 {
        return num
    }
    
    var tmp = num
    var sum = 0
    while tmp != 0 {
        let last = tmp % 10
        tmp = tmp / 10
        
        sum += last
    }
    
    return addDigits(sum)
}

// 最优解
// https://leetcode.com/problems/add-digits/discuss/68580/Accepted-C++-O(1)-time-O(1)-space-1-Line-Solution-with-Detail-Explanations
// digital root https://en.wikipedia.org/wiki/Digital_root#Congruence_formula
// base = 10
// dr(n) = 0 if n == 0
// dr(n) = (b-1) if n != 0 and n % (b-1) == 0
// dr(n) = n mod (b-1) if n % (b-1) != 0
// or dr(n) = 1 + (n - 1) % (b - 1)
print(addDigits(38))


