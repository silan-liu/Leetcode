func judgeCircle(_ moves: String) -> Bool {
    var x = 0, y = 0

    for cmd in moves {
        if cmd == "U" {
            y += 1
        } else if cmd == "D" {
            y -= 1
        } else if cmd == "L" {
            x -= 1
        } else if cmd == "R" {
            x += 1
        }
    }

    if x == 0 && y == 0 {
        return true
    }

    return false
}

print("\(judgeCircle("UD"))")
