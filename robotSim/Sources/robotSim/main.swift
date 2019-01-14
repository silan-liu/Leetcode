// https://leetcode.com/problems/walking-robot-simulation/submissions/
class Solution {
    var map = [String: [Int]]()
    
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var x = 0
        var y = 0
        var max = Int.min

        // 处理obstacle
        for obstacle in obstacles {
            if obstacle.count == 2 {
                var key = "x_" + String(obstacle[0])
                var value = map[key]
                if value == nil {
                    value = [Int]()
                }
                
                value?.append(obstacle[1])
                map[key] = value
                
                key = "y_" + String(obstacle[1])
                value = map[key]
                if value == nil {
                    value = [Int]()
                }
                
                value?.append(obstacle[0])
                map[key] = value
            }
        }

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
                handleObstacle(&x, &y, direction, cmd, obstacles)
                print(x,y)
                let result = x * x + y * y
                if max < result {
                    max = result
                }
            }
        }
        
        return max
    }
    
    func handleObstacle(_ x : inout Int, _ y  : inout Int, _ direction: Int, _ cmd: Int, _ obstacles: [[Int]]) {
        
        let xKey = "x_" + String(x)
        let yKey = "y_" + String(y)

        if direction == 0 {
            // up
            let tmp = y
            y += cmd
            var max = Int.min

            if let value = map[xKey], value.count > 0 {
                for v in value {
                    if tmp < v, y >= v {
                        let d = y - v
                        if d > max {
                            max = d
                            y = v - 1
                        }
                    }
                }
            }
        } else if direction == 1 {
            // r
            let tmp = x
            x += cmd
            var max = Int.min
            if let value = map[yKey], value.count > 0 {
                for v in value {
                    if tmp < v, x >= v {
                        let d = x - v
                        if d > max {
                            max = d
                            x = v - 1
                        }
                    }
                }
            }
            
        } else if direction == 2 {
            // d
            let tmp = y
            y -= cmd
            var min = Int.max
            if let value = map[xKey], value.count > 0 {
                for v in value {
                    if tmp > v, y <= v {
                        let d = y - v
                        if d < min {
                            min = d
                            y = v + 1
                        }
                    }
                }
            }

        } else if direction == 3 {
            // l
            let tmp = x
            x -= cmd
            
            var min = Int.max
            
            if let value = map[yKey], value.count > 0 {
                for v in value {
                    if tmp > v, x <= v {
                        let d = x - v
                        if d < min {
                            min = d
                            x = v + 1
                        }
                    }
                }
            }
        }
    }
}

// time limited exceed
func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
    var x = 0
    var y = 0
    var max = Int.min
    
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

            let result = x * x + y * y
            if max < result {
                max = result
            }
        }
    }

    return max
}

func beforeObstacle(_ x : inout Int, _ y  : inout Int, _ direction: Int, _ cmd: Int, _ obstacles: [[Int]]) {
 
    if direction == 0 {
        // up
        let tmp = y
        y += cmd
        var max = Int.min
        for obstacle in obstacles {
            if obstacle.count == 2 {
                if x == obstacle[0], tmp < obstacle[1], y >= obstacle[1] {
                    let d = y - obstacle[1]
                    if d > max {
                        max = d
                        y = obstacle[1] - 1
                    }
                }
            }
        }
    } else if direction == 1 {
        // r
        let tmp = x
        x += cmd
        var max = Int.min
        for obstacle in obstacles {
            if obstacle.count == 2 {
                if y == obstacle[1], tmp < obstacle[0], x >= obstacle[0] {
                    let d = x - obstacle[0]
                    if d > max {
                        max = d
                        x = obstacle[0] - 1
                    }
                }
            }
        }
    } else if direction == 2 {
        // d
        let tmp = y
        y -= cmd
        var min = Int.max
        for obstacle in obstacles {
            if obstacle.count == 2 {
                if x == obstacle[0], tmp > obstacle[1], y <= obstacle[1] {
                    let d = y - obstacle[1]
                    if d < min {
                        min = d
                        y = obstacle[1] + 1
                    }
                }
            }
        }
    } else if direction == 3 {
        // l
        let tmp = x
        x -= cmd

        var min = Int.max
        for obstacle in obstacles {
            if obstacle.count == 2 {
                if y == obstacle[1], tmp > obstacle[0], x <= obstacle[0] {
                    let d = x - obstacle[0]
                    if d < min {
                        min = d
                        x = obstacle[0] + 1
                    }
                }
            }
        }
    }
}


let commands = [4,-1,4,-2,4]

let obstacles = [[2,4]]
let result = robotSim(commands, obstacles)
print(result)

let s = Solution()
let r = s.robotSim(commands, obstacles)
print(r)
