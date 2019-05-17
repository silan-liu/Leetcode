// https://leetcode.com/problems/available-captures-for-rook/submissions/
class Solution {
    var flagList = [[Bool]]()
    var row = 0
    var column = 0
    var count = 0
    
    func numRookCaptures(_ board: [[Character]]) -> Int {
        if board.count > 0 {
            row = board.count
            if row > 0 {
                column = board[0].count
                if column == 0 {
                    return 0
                }
                
                var startX = 0
                var startY = 0
                
                // init flagList
                var i = 0
                while i < row {
                    
                    var j = 0
                    while j < column {
                        let char = board[i][j]
                        if char == "R" {
                            startX = i
                            startY = j
                            
                            return capture(board, 0, 1, startX, startY) + capture(board, 0, -1, startX, startY) + capture(board, -1, 0, startX, startY) + capture(board, 1, 0, startX, startY)
                            
                        }
                        
                        j += 1
                    }
                    
                    i += 1
                }
            }
        }
        
        return count
    }
    
    // 一直沿着一个方向走，遇到 B/p 停止
    func capture(_ board: [[Character]], _ dx: Int, _ dy: Int, _ x: Int, _ y: Int) -> Int {
        var m_x = x
        var m_y = y
        
        while m_x >= 0, m_x < row, m_y >= 0, m_y < column {
            
            let char = board[m_x][m_y]
            if char == "B" {
                return 0
            }
            
            if char == "p" {
                return 1
            }
            
            m_x += dx
            m_y += dy
        }
        
        
        return 0
    }
}


let s = Solution()

let board = [[Character("."),Character("."),Character("."),Character("."),Character("."),Character("."),Character("."),Character(".")],[Character("."),Character("."),Character("."),Character("p"),Character("."),Character("."),Character("."),Character(".")],[Character("."),Character("."),Character("."),Character("p"),Character("."),Character("."),Character("."),Character(".")],[Character("p"),Character("p"),Character("."),Character("R"),Character("."),Character("p"),Character("B"),Character(".")],[Character("."),Character("."),Character("."),Character("."),Character("."),Character("."),Character("."),Character(".")],[Character("."),Character("."),Character("."),Character("B"),Character("."),Character("."),Character("."),Character(".")],[Character("."),Character("."),Character("."),Character("p"),Character("."),Character("."),Character("."),Character(".")],[Character("."),Character("."),Character("."),Character("."),Character("."),Character("."),Character("."),Character(".")]]

print(s.numRookCaptures(board))
