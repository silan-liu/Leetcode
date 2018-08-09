// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
func maxProfit(_ prices: [Int]) -> Int {
    if prices.count < 2 {
        return 0
    }
    
    var i = 0
    var max = 0
    while i < prices.count - 1 {
        var j = i + 1
        
        while j < prices.count {
            let diff = prices[j] - prices[i]
            if diff > 0 && diff > max {
                max = diff
            }
            
            j += 1
        }
        
        i += 1
    }
    
    return max
 }
 
 let prices = [1,4,2]
 print(maxProfit(prices))
