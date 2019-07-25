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
    
    // 73.28%
    // 采用图的出度和入度方式
    func findJudge2(_ N: Int, _ trust: [[Int]]) -> Int {
        var list = [Int]()
        var i = 0
        while i <= N {
            list.append(0)
            i += 1
        }
        
        for t in trust {
            if t.count == 2 {
                // 出度-1
                list[t[0]] = list[t[0]] - 1
                
                // 入度+1
                list[t[1]] = list[t[1]] + 1
            }
        }
        
        i = 1
        while i <= N {
            if list[i] == N - 1 {
                return i
            }
            i += 1
        }
        
        return -1
    }
    
    //82.76%
    func findJudge3(_ N: Int, _ trust: [[Int]]) -> Int {
        // 两个数组记录，一个记录位置 i 相信的人数，一个记录位置 i 被相信的人数
        // 相信
        var t1 = [Int]()
        var i = 0
        while i <= N {
            t1.append(0)
            i += 1
        }
        
        // 被相信
        var t2 = [Int]()
        i = 0
        while i <= N {
            t2.append(0)
            i += 1
        }
        
        for t in trust {
            if t.count == 2 {
                
                t1[t[0]] += 1
                
                t2[t[1]] += 1
            }
        }
        
        i = 1
        while i <= N {
            if t2[i] == N - 1, t1[i] == 0 {
                return i
            }
            
            i += 1
        }
        
        return -1
    }
}

let s = Solution()
let N = 3, trust = [[1,3],[2,3]]
print(s.findJudge(N, trust))
print(s.findJudge2(N, trust))
print(s.findJudge3(N, trust))
