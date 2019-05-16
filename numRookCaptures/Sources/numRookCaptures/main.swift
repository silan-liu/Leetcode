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
                    var list = [Bool]()
                    
                    var j = 0
                    while j < column {
                        let char = board[i][j]
                        if char == "R" {
                            startX = i
                            startY = j
                            
                            list.append(true)
                        } else {
                            list.append(false)
                        }
                        
                        j += 1
                    }
                    
                    flagList.append(list)
                    
                    i += 1
                }
                
                recursive(startX, startY, board, board[startX][startY])
            }
        }
        
        return count
    }
    
    func recursive(_ x: Int, _ y: Int, _ board: [[Character]], _ last: Character) {
        if x >= 0, x < row, y >= 0, y < column {
            // 上
            if x - 1 >= 0 {
                // 未走过，并且非同色
                let char = board[x - 1][y]
                
                if !flagList[x - 1][y] && !isSameColor(char, last) {
                    // 未走过
                    if char == "p" {
                        print("x:\(x-1), y:\(y)")
                        count += 1
                    }
                    
                    flagList[x - 1][y] = true
                    recursive(x - 1, y, board, last)
                }
            }
            
            // 下
            if x + 1 < row {
                // 未走过，并且非同色
                let char = board[x + 1][y]
                
                if !flagList[x + 1][y] && !isSameColor(char, last) {
                    // 未走过
                    if char == "p" {
                        print("x:\(x+1), y:\(y)")
                        count += 1
                    }
                    
                    flagList[x + 1][y] = true
                    recursive(x + 1, y, board, last)
                }
            }
            
            // 左
            if y - 1 >= 0 {
                // 未走过，并且非同色
                let char = board[x][y - 1]
                
                if !flagList[x][y - 1] && !isSameColor(char, last) {
                    // 未走过
                    if char == "p" {
                        print("x:\(x), y:\(y - 1)")
                        count += 1
                    }
                    
                    flagList[x][y - 1] = true

                    recursive(x, y - 1, board, char)
                }
            }
            
            // 右
            if y + 1 < column {
                // 未走过，并且非同色
                let char = board[x][y + 1]
                
                if !flagList[x][y + 1] && !isSameColor(char, last) {
                    // 未走过
                    if char == "p" {
                        print("x:\(x), y:\(y + 1)")

                        count += 1
                    }
                    
                    flagList[x][y + 1] = true

                    recursive(x, y + 1, board, char)
                }
            }
        }
    }
    
    func isSameColor(_ x: Character, _ y: Character) -> Bool {

        // 同为大小写
        if x >= "a", x <= "z", y >= "a", y <= "z" {
            return true
        }
        
        if x >= "A", x <= "Z", y >= "A", y <= "Z" {
            return true
        }
        
        return false
    }
}


let s = Solution()

let board = [[Character("."),Character("."),Character("."),Character("."),Character("."),Character("."),Character("."),Character(".")],[Character("."),Character("."),Character("."),Character("p"),Character("."),Character("."),Character("."),Character(".")],[Character("."),Character("."),Character("."),Character("p"),Character("."),Character("."),Character("."),Character(".")],[Character("p"),Character("p"),Character("."),Character("R"),Character("."),Character("p"),Character("B"),Character(".")],[Character("."),Character("."),Character("."),Character("."),Character("."),Character("."),Character("."),Character(".")],[Character("."),Character("."),Character("."),Character("B"),Character("."),Character("."),Character("."),Character(".")],[Character("."),Character("."),Character("."),Character("p"),Character("."),Character("."),Character("."),Character(".")],[Character("."),Character("."),Character("."),Character("."),Character("."),Character("."),Character("."),Character(".")]]

print(s.numRookCaptures(board))

print(s.isSameColor(Character("R"), Character("B")))
