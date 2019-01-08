// https://leetcode.com/problems/can-place-flowers/submissions/
// 花不能相邻
func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    var plots = flowerbed
    var total = n

    var i = 0
    while i < plots.count, total > 0 {
        // empty
        if plots[i] == 0 {
            var canPlace = 0
            // before
            if i - 1 >= 0 {
                if plots[i-1] == 0 {
                    canPlace += 1
                }
            } else {
                canPlace += 1
            }

            // after
            if i + 1 < plots.count {
                if plots[i+1] == 0 {
                    // ok
                    canPlace += 1
                } else {
                    // skip
                    i += 1
                }
            } else {
                // ok
                canPlace += 1
            }

            if canPlace == 2 {
                plots[i] = 1
                total -= 1
            }
        }

        i += 1
    }

    return total == 0
}

let flowerbed = [0,0,1,0,0], n = 1
print(canPlaceFlowers(flowerbed, n))