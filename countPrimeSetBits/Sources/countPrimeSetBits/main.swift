// https://leetcode.com/problems/prime-number-of-set-bits-in-binary-representation/description/
func countPrimeSetBits(_ L: Int, _ R: Int) -> Int {
    var result = 0
    for i in L...R {
        let count = countOfBitOne(i)
        if isPrime(count) {
            print(i)
            result += 1
        }
    }
    
    return result
}

func countOfBitOne(_ n: Int) -> Int {
    var tmp = n
    var count = 0
    
    while tmp != 0 {
        if tmp & 0x1 != 0 {
            count += 1
        }
        
        tmp >>= 1
    }
    
    return count
}

func isPrime(_ n: Int) -> Bool {
    if n == 1 {
        return false
    }
    
    var i = 2
    while i <= n / 2 {
        if n % i == 0 {
            return false
        }
        
        i += 1
    }
    
    return true
}

let L = 6, R = 10

print(countPrimeSetBits(L, R))
