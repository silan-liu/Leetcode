// https://leetcode.com/problems/buddy-strings/submissions/
func buddyStrings(_ A: String, _ B: String) -> Bool {
    if A.count != B.count {
        return false
    }

    var listA = Array(A)
    var listB = Array(B)
    
    // 如果A和B相等，则判断A有没有相同的字符。
    var map = [Character: Int]()
    if A == B {
        var j = 0
        while j < listA.count {
            let c = listA[j]
            if let _ = map[c] {
                return true
            }

            map[c] = 1

            j += 1
        }

        return false
    }

    // 找出不同的字符
    var differentCount = 0

    var i = 0
    var differentIndex1 = -1
    var differentIndex2 = -1
    while i < listA.count {
        if listA[i] != listB[i] {
            differentCount += 1

            if differentCount == 1 {
                differentIndex1 = i;
            } else if differentCount == 2 {
                differentIndex2 = i;
            } else if differentCount > 2 {
                return false
            }
        }

        i += 1
    }

    if differentIndex1 != -1, differentIndex2 != -1, listA[differentIndex1] == listB[differentIndex2], listA[differentIndex2] == listB[differentIndex1] {
        return true
    }

    return false
}

let A = "abbc", B = "abbd"
print(buddyStrings(A, B))