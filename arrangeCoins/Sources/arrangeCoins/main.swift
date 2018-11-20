// https://leetcode.com/problems/arranging-coins/submissions/
func arrangeCoins(_ n: Int) -> Int {
    var level = 0
    var total = n
    while total > 0 {
        level += 1
        total -= level
    }
    
    if total == 0 {
        return level
    } else {
        return level - 1
    }
}

let n = 3
print(arrangeCoins(n))
