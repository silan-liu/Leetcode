// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/
func maxProfit(_ prices: [Int]) -> Int {
    var i = 1
    var max = 0
    
    while i < prices.count {
        if prices[i] > prices[i - 1] {
            max += prices[i] - prices[i - 1]
        }
        
        i += 1
    }
    
    return max
}


let prices = [7,1,5,3,6,4,9,10,23]

print(maxProfit(prices))


