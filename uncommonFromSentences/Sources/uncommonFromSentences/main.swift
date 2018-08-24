// https://leetcode.com/problems/uncommon-words-from-two-sentences/description/
func uncommonFromSentences(_ A: String, _ B: String) -> [String] {
    let listA = A.split(separator: " ")
    let listB = B.split(separator: " ")
    
    let total = listA + listB
    var map = [String: Int]()
    
    for str in total {
        let key = String(str)
        if let value = map[key] {
            map[key] = value + 1
        } else {
            map[key] = 1
        }
    }
    
    var result = [String]()
    for (key, value) in map {
        if value == 1 {
            result.append(key)
        }
    }
    
    return result
}

let A = "apple apple", B = "banana"
print(uncommonFromSentences(A, B))
