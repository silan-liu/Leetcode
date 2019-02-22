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

    func deckRevealedIncreasing2(_ deck: [Int]) -> [Int] {
        let sortedDeck = deck.sorted()

        // 假设result是正确结果
        var result = [Int]()

        // 用于模拟deck移动
        var index = [Int]()

        var i = 0
        while i < sortedDeck.count {
            index.append(i)
            result.append(0)
            i += 1
        }

        i = 0
        while i < sortedDeck.count {
            // index.first这个位置应填入升序排列的值
            result[index[0]] = sortedDeck[i]
            
            // 模拟，移除第一个，下一个，移到最后
            index.removeFirst()

            if index.count > 1 {
                index.append(index[0])
                index.removeFirst()
            }

            i += 1
        }

        return result
    }
}

let s = Solution()
let deck = [17,5,4,8,9,0,1,2,15,13,100]
print(s.deckRevealedIncreasing(deck))
print(s.deckRevealedIncreasing2(deck))