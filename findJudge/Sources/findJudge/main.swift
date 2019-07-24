// https://leetcode.com/problems/find-the-town-judge/
class Solution {
    // 10.34% 
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        
        if N == 1 {
            return 1
        }
        
        // 相信某个人key的列表value
        var map = [Int: Set<Int>]()
        
        // 表示 key 相信 value
        var trustMap = [Int: Int]()
        
        for t in trust {
            if t.count == 2 {
                trustMap[t[0]] = t[1]
                
                if var set = map[t[1]] {
                    set.insert(t[0])
                    map[t[1]] = set
                } else {
                    var set = Set<Int>()
                    set.insert(t[0])
                    
                    map[t[1]] = set
                }
            }
        }
        
        for (key,value) in map {
            // N-1个人相信法官，但法官不相信其他人
            if value.count == N - 1, trustMap[key] == nil {
                return key
            }
        }
 
        return -1
    }
}

let s = Solution()
let N = 3, trust = [[1,3],[2,3],[3,1]]
print(s.findJudge(N, trust))
