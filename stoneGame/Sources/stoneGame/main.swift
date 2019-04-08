// https://leetcode.com/problems/stone-game/solution/
class Solution {
    var cacheMap = [String: Int]()
    
    func stoneGame(_ piles: [Int]) -> Bool {
        return true
    }
    
    func stoneGame_2(_ piles: [Int]) -> Bool {
        let stone = dp(0, piles.count - 1, piles)
        var sum = 0
        for pile in piles {
            sum += pile
        }
        
        print(stone)
        return stone > sum - stone
    }
    
    func dp(_ i: Int, _ j: Int, _ piles: [Int]) -> Int {
        
        if i > j  {
            return 0
        }
        
        if i == j, j < piles.count {
            return piles[i]
        }
        
        
        let key = "\(i)_\(j)"
        if let value = cacheMap[key] {
            return value
        }
        
        // Alex 取第一个，然后下一次只能取到 Lee 剩下的最小的。Lee 可以取第一个或最后一个。
        let first = piles[i] + min(dp(i + 2, j, piles), dp(i + 1, j - 1, piles))
        
        // Alex 取最后一个，然后下一次只能取到 Lee 剩下的最小的。
        let last = piles[j] + min(dp(i, j - 2, piles), dp(i + 1, j - 1, piles))
        
        let maxStone = max(first, last)
        cacheMap[key] = maxStone
        
        return maxStone
    }
}


let s = Solution()
let piles = [2,2,1,3,5,2]
print(s.stoneGame(piles))
print(s.stoneGame_2(piles))
