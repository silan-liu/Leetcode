// https://leetcode.com/problems/bulls-and-cows/submissions/
class Solution {
    // 82.61%
    func getHint(_ secret: String, _ guess: String) -> String {
        if secret.count == guess.count {
            let secretList = Array(secret)
            let guessList = Array(guess)
            
            var map = [Character: Int]()
            var i = 0
            var cowCount = 0
            var bullCount = 0
            
            var remainList = [Character]()
            
            while i < secretList.count {
                let s = secretList[i]
                let g = guessList[i]

                if s == g {
                    bullCount += 1
                } else {
                    if let count = map[s] {
                        map[s] = count + 1
                    } else {
                        map[s] = 1
                    }
                    
                    remainList.append(g)
                }
                
                i += 1
            }
            
            i = 0
            while i < remainList.count {
                let g = remainList[i]
            
                if let count = map[g], count >= 1 {
                    cowCount += 1
                    
                    // 数量-1
                    map[g] = count - 1
                }
                
                i += 1
            }
            
            return "\(bullCount)A\(cowCount)B"
        }
        
        return ""
    }
}

let s = Solution()
let secret = "1011", guess = "1112"
print(s.getHint(secret, guess))
