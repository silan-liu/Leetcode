func rotateString(_ A: String, _ B: String) -> Bool {
    if A.count != B.count {
        return false
    }
    
    if A == B {
        return true
    }
    
    let maxShiftCount = A.count
    var i = 0
    var tmp = A
    
    while i < maxShiftCount {
        // shift
        let index = tmp.index(tmp.startIndex, offsetBy: 0)
        let c = tmp[index]
        
        tmp.append(c)
        tmp.remove(at: index)
        
        if tmp == B {
            return true
        }
        i += 1
    }
    
    return false
}


let A = "", B = ""
print(rotateString(A, B))
