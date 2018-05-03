func arrayPairSum(_ nums: [Int]) -> Int {
    let sorted = nums.sorted()
    if sorted.count % 2 != 0 {
        return 0
    }
    
    let group = sorted.count / 2

    var sum = 0

    var index = 0
    while index < group {
         
        print("index:\(index)")
        sum += sorted[index * 2]

        index += 1
    }

    return sum      
}

print("\(arrayPairSum([1,9,0,7,4,5]))")
