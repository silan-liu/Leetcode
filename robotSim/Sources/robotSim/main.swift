func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
    var x = 0
    var y = 0

    // 0-up, 2-down, 3-left, 1-right
    var direction = 0
    for cmd in commands {
        // turn left 90 degree
        if cmd == -2 {
            direction = (direction + 3) % 4
        } else if cmd == -1 {
            // tuen right 90 degree
            direction = (direction + 1) % 4
        } else if cmd >= 1 && cmd <= 9 {
            // move forward
            beforeObstacle(&x, &y, direction, cmd, obstacles)
        }
    }

    return x * x + y * y
}

func beforeObstacle(_ x : inout Int, _ y  : inout Int, _ direction: Int, _ cmd: Int, _ obstacles: [[Int]]) {
    if obstacles.count == 0 {
        return
    }

    if direction == 0 {
        // up
        y += cmd

        var min = Int.max
        for obstacle in obstacles {
            if obstacle.count == 2 {
                if y >= obstacle[1] {
                    let d = y - obstacle[1]
                    if min < d {
                        min = d
                        y = obstacle[1] - 1
                    }
                }
            }
        }
    } else if direction == 1 {
        // r
        x += cmd
        var min = Int.max
        for obstacle in obstacles {
            if obstacle.count == 2 {
                if x >= obstacle[0] {
                    let d = x - obstacle[0]
                    if min < d {
                        min = d
                        x = obstacle[0] - 1
                    }
                }
            }
        }
    } else if direction == 2 {
        // d
        y -= cmd
        var min = Int.max
        for obstacle in obstacles {
            if obstacle.count == 2 {
                if y <= obstacle[1] {
                    let d = y - obstacle[1]
                    if min < d {
                        min = d
                        y = obstacle[1] + 1
                    }
                }
            }
        }
    } else if direction == 3 {
        // l
        x -= cmd

        var min = Int.max
        for obstacle in obstacles {
            if obstacle.count == 2 {
                if x <= obstacle[0] {
                    let d = x - obstacle[0]
                    if min < d {
                        min = d
                        x = obstacle[0] + 1
                    }
                }
            }
        }
    }
}

let commands = [4,-1,3], obstacles = [[Int]]()
let result = robotSim(commands, obstacles)
print(result)
