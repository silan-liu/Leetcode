// https://leetcode.com/problems/battleships-in-a-board
func countBattleships(_ board: [[Character]]) -> Int {
    let rows = board.count
    var columns = 0
    if rows > 0 {
        columns = board[0].count
    }

    var count = 0
    var i = 0

    while i < rows {
        
        for j in 0..<columns {
            if board[i][j] == "." {
                continue
            }

            // left
            if j > 0, board[i][j - 1] == "X" {
                continue
            }

            // top
            if i > 0, board[i - 1][j] == "X" {
                continue
            }

            count += 1
        }

        i += 1
    }

    return count
}

let board = [[Character("X"), Character("X"), Character("."), Character("X")],
            [Character("."), Character("."), Character("."), Character("X")],
            [Character("."), Character("."), Character("."), Character("X")]]

print(countBattleships(board))

