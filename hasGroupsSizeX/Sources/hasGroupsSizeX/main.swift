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

let deck = [1,1,2,2,2,2]
print(hasGroupsSizeX(deck))