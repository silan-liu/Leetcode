func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var set1 = Set<Int>()
    var set2 = Set<Int>()
    
    for num in nums1 {
        set1.insert(num)
    }
    
    for num in nums2 {
        set2.insert(num)
    }
    
    let result = set1.intersection(set2)
    return Array(result)
}

func intersection_2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var map = [Int: Int]()

    var result = Set<Int>()
    
    for num in nums2 {
        map[num] = 1
    }
    
    for num in nums1 {
        if let _ = map[num] {
            result.insert(num)
        }
    }
    
    return Array(result)
}

let nums1 = [1, 2, 2, 1, 3], nums2 = [2, 3]

print(intersection(nums1, nums2))
print(intersection_2(nums1, nums2))
