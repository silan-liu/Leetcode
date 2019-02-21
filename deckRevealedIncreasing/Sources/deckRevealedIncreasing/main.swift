// https://leetcode.com/problems/reveal-cards-in-increasing-order/submissions/
class Solution {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        let sortedDeck = deck.sorted()

        var result = [Int]()
        // 按结果倒推
        var i = sortedDeck.count - 1
        while i >= 0 {
            let value = sortedDeck[i]
            if result.count <= 1 {
                // 插入最前面
                result.insert(value, at: 0)
            } else {
                // 把最后一个数移到第一个
                let last = result.last!
                result.insert(last, at: 0)
                result.removeLast()

                // 插入最前面
                result.insert(value, at: 0)
            }

            i -= 1
        }

        return result
    }
}

let s = Solution()
let deck = [17,5,4,8]
print(s.deckRevealedIncreasing(deck))