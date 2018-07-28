// https://leetcode.com/problems/intersection-of-two-arrays-ii/description/
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let count1 = nums1.count
    let count2 = nums2.count
    
    var longArray = count1 > count2 ? nums1 : nums2
    let shortArray = count1 <= count2 ? nums1 : nums2
    
    var result = [Int]()
    for n in shortArray {
        
        if longArray.contains(n) {
            let index = longArray.index(of: n)
            longArray.remove(at: index!)
            
            result.append(n)
        }
    }
    
    return result
}

let nums1 = [1, 2], nums2 = [1, 1]

print(intersect(nums1, nums2))
