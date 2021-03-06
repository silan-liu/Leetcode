
import Cocoa

https://leetcode.com/problems/powerful-integers/submissions/
class Solution {
    // 91.30%
    func powerfulIntegers(_ x: Int, _ y: Int, _ bound: Int) -> [Int] {
        if bound == 0 {
            return []
        }
        
        let xMaxPower = calculate(x, bound)
        let yMaxPower = calculate(y, bound)
        
        if xMaxPower == -1 || yMaxPower == -1 {
            return []
        }
        
        // 无重复
        var result = Set<Int>()
        var i = 0
        
        while i <= xMaxPower {
            var j = 0
            while j <= yMaxPower {
                let sum = Int(pow(Double(x), Double(i)) + pow(Double(y), Double(j)))
                if sum <= bound && !result.contains(sum) {
                    result.insert(sum)
                }
                
                j += 1
            }
           
            i += 1
        }
        
        return Array(result)
    }
    
    func calculate(_ x: Int, _ bound: Int) -> Int {
        // 因为 1 的 N 次方始终是 1，只需要返回 0，能遍历一次就好。
        if x == 1 {
            return 0
        }
        
        if bound == 0 {
            return -1
        }
        
        var r = 1
        var p = 0
        
        while r * x <= bound {
            r *= x
            p += 1
        }
        
        return p
    }
}

let s = Solution()
let x = 1, y = 3, bound = 15
print(s.powerfulIntegers(x, y, bound))

let l1 = [247,737,1025,16387,65779,11,4235,2777,29,7073,793,7585,72097,19811,244,19691,73,6689,6569,82,307,8193,59053,4339,66265,65545,745,6562,6625,337,65563,28,251,18571,499,1105,33,23779,59113,33497,265,4,63145,113,17,2699,65617,2129,10379,39329,85219,13,6817,60073,10,59051,985,1027,59065,32849,2188,6565,145,5,2051,43,67,97,27875,245,3,19699,20195,8219,857,2195,16411,59,41,91,10657,8273,283,16627,32795,4825,733,59177,2315,19715,4099,4097,91817,2189,1267,593,19939,59561,6593,59081,2219,35,761,137,2057,83,19747,755,2075,59305,2291,2,25,89,2443,8195,19,65,67241,16393,32777,513,52451,65537,19685,31,6563,257,730,32771,59057,59050,33011,3211,4177,1241,1753,731,129,539,61097,7,34955,65539,8921,4105,259,371,17113,131,155,19687,75433,1033,32769,22945,85,9,6577,6283,16385,2049,2251,275,8609,209,21731,2203,515,521,1051,16465,36067,8435,14753,2191,19684,4123,67723,8201,20707].sorted()

let l2 = [513,2,3,4,5,4177,7,60073,9,10,11,13,17,19,8201,25,539,28,29,31,6689,35,16385,41,43,8219,10657,155,521,59,65545,27875,65,67,1025,73,593,82,83,2219,32795,89,91,16387,97,2049,36067,67241,515,113,65779,1027,129,131,8273,16627,137,8921,2699,2188,2189,2191,145,2195,18571,2203,39329,2051,6817,1051,4097,1267,65539,59561,59050,59051,59053,85219,59057,32771,59065,72097,22945,33011,33,19715,59081,2251,65537,209,4235,32769,1241,730,731,733,4099,737,20195,19684,19685,19687,59113,19691,19699,244,245,247,65563,761,251,257,259,4339,265,2315,275,4825,1753,793,283,19747,8193,34955,67723,59177,16411,307,1033,3211,21731,61097,337,20707,2057,75433,52451,857,8195,19811,6283,2075,371,16393,745,14753,32777,16465,23779,63145,17113,2443,4105,7073,6562,6563,6565,91817,6569,8435,4123,6577,755,32849,6593,66265,2129,7585,2777,33497,985,65617,6625,19939,2291,1105,10379,8609,499,59305,85].sorted()

print(l1.elementsEqual(l2))
