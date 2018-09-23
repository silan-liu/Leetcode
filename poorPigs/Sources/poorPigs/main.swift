import Foundation

// https://leetcode.com/problems/poor-pigs/description/
func poorPigs(_ buckets: Int, _ minutesToDie: Int, _ minutesToTest: Int) -> Int {
    let count = minutesToTest / minutesToDie
    
    // 以次数+1为N进制，将桶编号, (count+1)^N = buckets
    // 第0次，给1..m猪喝位上为0的水...第n次，给猪喝位上为n的水
    let num = logC(val: Double(buckets), forBase: Double(count+1))
    return Int(ceil(num))
}

func logC(val: Double, forBase base: Double) -> Double {
    return log(val)/log(base)
}

print(poorPigs(1000, 15, 60))
