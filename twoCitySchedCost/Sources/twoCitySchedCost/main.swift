// https://leetcode.com/problems/two-city-scheduling/submissions/
class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        let sortedCosts = costs.sorted { (a, b) -> Bool in
            return (a[1] - a[0]) < (b[1] - b[0])
        }
        
        var i = 0
        var s = 0
        
        while i < sortedCosts.count / 2 {
            
            s += sortedCosts[i][1] + sortedCosts[sortedCosts.count - i - 1][0]
            i += 1
        }
        
        return s
    }
}

let s = Solution()
let costs = [[10,20],[30,10],[30,50],[40,60]]
print(s.twoCitySchedCost(costs))
