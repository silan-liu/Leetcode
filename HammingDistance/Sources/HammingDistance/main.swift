func hammingDistance(_ x: Int, _ y: Int) -> Int {
    
    var max = x > y ? x : y
    var x1 = x
    var y1 = y

    var distance = 0

    while max != 0 {
        let xLastBit = x1 & 0x1
        let yLastBit = y1 & 0x1

        if xLastBit != yLastBit {
            distance = distance + 1
        } 

        x1 = x1 >> 1
        y1 = y1 >> 1
        max = max >> 1
    }

    return distance        
}

func hammingDistance_2(_ x: Int, _ y: Int) -> Int {
    var result = x ^ y

    var distance = 0

    while result != 0 {
        if result & 0x1 == 1 {
            distance =  distance + 1
        }

        result = result >> 1
    }

    return distance
}

func hammingDistance_3(_ x: Int, _ y: Int) -> Int {
    var result = x ^ y

    var distance = 0

    while result != 0 {
        distance = distance + 1

        // 把最右边的1变成0
        result &= (result - 1)
    }

    return distance
}

print("\(hammingDistance(2, 4))")
print("\(hammingDistance_2(2, 4))")
print("\(hammingDistance_3(2, 4))")