// https://leetcode.com/problems/fair-candy-swap/description/
func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
    var sa = 0
    for a in A {
        sa += a
    }
    
    var sb = 0
    var map = [Int: Int]()
    for b in B {
        sb += b
        map[b] = 1
    }
    
    let diff = (sb - sa) / 2
    
    for a in A {
        let b = a + diff
        if let _ = map[b] {
            return [a, b]
        }
    }
    
    return []
}

let A = [1,2,5], B = [2,4]
print(fairCandySwap(A, B))
