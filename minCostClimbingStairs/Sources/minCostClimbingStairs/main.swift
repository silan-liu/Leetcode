// 递归算法，耗时长
func minCostClimbingStairs(_ cost: [Int]) -> Int {
    let count = cost.count
    if count == 0 {
        return 0
    } else if count == 1 {
        return 0
    } else if count == 2 {
        return min(cost[0], cost[1])
    } else if count == 3 {
        return min(cost[0] + cost[2], cost[1])
    } else {
        // 可走1步
        let subCost1 = Array(cost[1..<cost.count])
        let c1 = cost[0] + minCostClimbingStairs(subCost1)
        
        // 可走2步
        let subCost2 = Array(cost[2..<cost.count])
        let c2 = cost[1] + minCostClimbingStairs(subCost2)
        
        return min(c1, c2)
    }
}

let cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1, 3, 4, 1, 23, 4,5,6,7,8,3,3,3,4,5,6,78,2,133,3,5]
print(minCostClimbingStairs(cost))
