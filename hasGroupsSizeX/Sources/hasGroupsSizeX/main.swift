// https://leetcode.com/problems/x-of-a-kind-in-a-deck-of-cards/submissions/
func hasGroupsSizeX(_ deck: [Int]) -> Bool {
    if deck.count <= 1 {
        return false
    }

    var map = [Int: Int]()

    for n in deck {
        var count = map[n]
        if count == nil {
            count = 1
        } else {
            count! += 1
        }
        map[n] = count!
    }

    print(map)

    var count = 2
    while count <= deck.count {
         // 能整除
        if deck.count % count == 0 {
            var flag = true
            for (_, value) in map {
                // 同一个数，不能分组
                if value % count != 0 {
                    flag = false
                    continue
                }
            }

            if flag {
                return true
            }
        } 

        count += 1
    }

    return false
}

// 求最大公约数，如果公约数>=2，则满足。
// greatest common divisor
func hasGroupsSizeX_2(_ deck: [Int]) -> Bool {
    if deck.count <= 1 {
        return false
    }

    var map = [Int: Int]()

    for n in deck {
        var count = map[n]
        if count == nil {
            count = 1
        } else {
            count! += 1
        }
        map[n] = count!
    }

    var count = -1
    for (_, value) in map {
        if count == -1 {
            count = value
        } else {
            count = gcd(count, value)
        }
    }

    return count >= 2
}

func gcd(_ x: Int, _ y: Int) -> Int {
    return x == 0 ? y : gcd(y % x, y)
}

let deck = [1,1,2,2,2,2]
print(hasGroupsSizeX(deck))
print(hasGroupsSizeX_2(deck))