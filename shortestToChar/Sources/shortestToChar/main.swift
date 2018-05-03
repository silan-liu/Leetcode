
func shortestToChar(_ S: String, _ C: Character) -> [Int] {
    let len = S.count
    var i = 0
    var indexChar = [Int]()
    
    while i < len {
        let index = S.index(S.startIndex, offsetBy: i)
        let s = S[index]
        if s == C {
            indexChar.append(i)
        }
        
        i += 1
    }
    
    print(indexChar)
    var shortestList = [Int]()
    
    i = 0
    
    while i < len {
        let index = S.index(S.startIndex, offsetBy: i)
        let s = S[index]
        if s == C {
            shortestList.append(0)
        } else {
            let shortestIndex = findShortestDistance(i, indexChar)
            shortestList.append(shortestIndex)
        }
        
        i += 1
    }

    return shortestList
}

func findShortestDistance(_ index: Int, _ indexArray: [Int]) -> Int {
    var low = 0
    var high = indexArray.count - 1
    
    if index < indexArray[low] {
        return indexArray[low] - index
    } else if index > indexArray[high] {
        return index - indexArray[high]
    }
    
    while low <= high {
        let middle = (low + high) / 2
        let value = indexArray[middle]
        if high - low == 1 {
            let dis1 = indexArray[high] - index
            let dis2 = index - indexArray[low]
            
            return dis1 < dis2 ? dis1 : dis2
        } else if index > value {
            low += 1
        } else {
            high -= 1
        }
    }
    
    return -1
}

let result = shortestToChar("loveleetcode", "l")
print(result)
