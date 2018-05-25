 // https://leetcode.com/problems/single-number/description/
 // a^a=0,0^a=a
 func singleNumber(_ nums: [Int]) -> Int {
    var a = 0
    
    for num in nums {
        a = a ^ num
    }
    
    return a
 }
 
 print(singleNumber([4,1,2,1,2]))
