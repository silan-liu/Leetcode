class Solution {
    func isRobotBounded(_ instructions: String) -> Bool {
        var x = 0
        var y = 0
        
        // 1-向上，2-向左，3-向下，4-向右
        var direction = 0
        for instruction in instructions {
            if instruction == "G" {
                if direction == 0 {
                    y += 1
                } else if direction == 1 {
                    x -= 1
                } else if direction == 2 {
                    y -= 1
                } else if direction == 3 {
                    x += 1
                }
            
            } else if instruction == "L" {
                direction = (direction + 1) % 4
            } else if instruction == "R" {
                direction = (direction - 1 + 4) % 4
            }
        }
        
        return x == 0 && y == 0 || direction > 0
    }
}

let s = Solution()
let instructions = "GLGLGGLGLG"
print(s.isRobotBounded(instructions))

