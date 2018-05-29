 func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
    var result = [[Int]]()
    
    for row in A {
        // flip
        let count = row.count
        var i = count - 1
        var newRow = [Int]()
        
        while i >= 0 {
            let num = row[i]
            let invertNum = num ^ 1
            newRow.append(invertNum)
            
            i -= 1
        }
        
        result.append(newRow)
    }
    
    return result
 }
 
 func flipAndInvertImage_2(_ A : inout [[Int]]) -> [[Int]] {
    
    var j = 0
    for row in A {
        // flip
        let count = row.count
        var i = 0
        
        var len = 0
        if count / 2 == 0 {
            len = count / 2 - 1
        } else {
            // 奇数，先将中间数值调整
            len = count / 2
            A[j][len] = A[j][len] ^ 1
        }
        
        while i <= len {
            let a = row[i] ^ 1
            let b = row[count - i - 1] ^ 1
            
            A[j][i] = b
            A[j][count - i - 1] = a
            
            i += 1
        }
        
        j += 1
    }
    
    return A
 }
 
 var a = [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]
 
 print(flipAndInvertImage_2(&a))
