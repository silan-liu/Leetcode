import Foundation

var primes = [2,3,5,7,11,13,17,19,31,37,41,43,47]

func countPrimes(_ n: Int) -> Int {
    var i = 2
    var count = 0
    while i < n {
        if isPrime(i) {
            count += 1
        }

        i += 1
    }

    return count
}

func isPrime(_ n: Int) -> Bool {
    if n <= 1 {
        return false
    }

    var i = 2
    let q = Int(sqrt(Double(n)))

    while i <= q {
        if n % i == 0 {
            return false
        }

        i += 1
    }

    return true
}

print(countPrimes(499979))