// https://leetcode.com/problems/keys-and-rooms/submissions/
class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        // 房间是否已经打开
        var visited = [Bool]()
        var i = 0
        while i < rooms.count {
            visited.append(false)
            i += 1
        }
        
        var stack = [Int]()
        stack.append(0)
        visited[0] = true
        
        while stack.count > 0 {
            let room = stack.last!
            stack.removeLast()
            
            if room >= 0, room < rooms.count {
                let keys = rooms[room]
                
                for key in keys {
                    if !visited[key] {
                        visited[key] = true
                        stack.append(key)
                    }
                }
            }
        }
        
        for v in visited {
            if !v {
                return false
            }
        }
        
        return true
    }
    
    func canVisitAllRooms_2(_ rooms: [[Int]]) -> Bool {
        // 房间是否已经打开
        var visited = [Bool]()
        var i = 0
        while i < rooms.count {
            visited.append(false)
            i += 1
        }
        
        recursive(rooms, 0, &visited)
        
        for v in visited {
            if !v {
                return false
            }
        }
        
        return true
    }
    
    func recursive(_ rooms: [[Int]], _ curRoom: Int, _ visited: inout [Bool]) {
        // 如果没有进过房间
        if !visited[curRoom] {
            visited[curRoom] = true
        } else {
            return
        }
        
        if curRoom >= 0, curRoom < rooms.count {
            let keys = rooms[curRoom]
            
            for key in keys {
                recursive(rooms, key, &visited)
            }
        }
    }
}

let s = Solution()
let rooms = [[1,3],[2],[1],[0]]
print(s.canVisitAllRooms(rooms))
print(s.canVisitAllRooms_2(rooms))
