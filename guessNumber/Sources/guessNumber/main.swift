// https://leetcode.com/problems/guess-number-higher-or-lower/
func guessNumber(_ n: Int, _ pick: Int) -> Int {
    var low = 1
    var high = n
    
    while low <= high {
        let mid = low + (high - low) / 2
        
        let result = guess(mid, pick)
        if result == 0 {
            return mid
        } else if result == -1 {
            // lower
            low = mid + 1
        } else if result == 1 {
            // higher
            high = mid - 1
        }
    }
    
    return -1
}

func guess(_ num: Int, _ pick: Int) -> Int {
    if num < pick {
        return -1
    } else if num == pick {
        return 0
    } else {
        return 1
    }
}

print(guessNumber(10, 6))
