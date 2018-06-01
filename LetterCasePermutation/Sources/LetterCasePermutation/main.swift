import Foundation

// https://leetcode.com/problems/letter-case-permutation
// abc 初始状态，queue中只有S
// abc - > abc Abc。 i = 0, 此时queueCount = 1, queue中元素逐个出队, abc 出队，abc Abc入队
// abc Abc -> abc aBc Abc ABc。  i = 1
// abc aBc Abc ABc -> abc abC aBc aBC Abc AbC ABc ABC。 i = 2
func letterCasePermutation(_ S: String) -> [String] {
    var queue = [String]()
    
    queue.append(S)
    
    var i = 0
    while i < S.count {
        let index = S.index(S.startIndex, offsetBy: i)
        let s = String(S[index])
        if (s >= "a" && s <= "z") || (s >= "A" && s <= "Z") {
            var j = 0
            let queueCount = queue.count
            while j < queueCount {
                if var str = queue.first {
                    queue.removeFirst()
                    
                    // lowercase
                    let lowercased = s.lowercased()
                    
                    str.replaceSubrange(index...index, with: lowercased)
                    
                    queue.append(str)
                    
                    // uppercase
                    let uppercased = s.uppercased()
                    
                    str.replaceSubrange(index...index, with: uppercased)
                    
                    queue.append(str)
                }
                
                j += 1
            }
            
            print(queue)
        }
        
        i += 1
    }
    
    return queue
}

let S = "RmR"
print(letterCasePermutation(S))
