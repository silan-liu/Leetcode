
// https://leetcode.com/problems/distribute-candies/description/
func distributeCandies(_ candies: [Int]) -> Int {
    let average = candies.count / 2
    var candySet = Set<Int>()
    
    for candy in candies {
        candySet.insert(candy)
    }
    
    let kinds = candySet.count
    return kinds < average ? kinds : average
}

print(distributeCandies([1,1,2,2,3,3,4,5]))
