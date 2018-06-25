/*1,4,5
2,5,5,
3,6,5
4,6,6,
5,7,6,
6,7,7,
7,8,7
8,8,8


1,2,3,4
2,3,4,4
3,4,5,4
4,5,5,5
5,6,6,5,
6,6,7,6
7,7,7,7
 */

// 耗时太长
func minMoves(_ nums: [Int]) -> Int {
    var result = 0
    var tmp = nums
    
    while !allEqual(tmp) {
        
        // 除最大的数之外，其余都+1
        let value = maxIndex(tmp)
        let index = value.0
        let move = value.1
        result += move

        if index >= 0 && index < tmp.count {
            
            var i = 0
            while i < tmp.count {
                if i != index {
                    tmp[i] = tmp[i] + move
                }
                
                i += 1
            }
            
        } else {
            break;
        }
    }
    
    return result
}

// 最大数的index
func maxIndex(_ nums: [Int]) -> (Int, Int) {
    if nums.count == 0 {
        return (-1, 1)
    }
    
    var max = nums[0]
    var index = 0
    var max_2 = nums[0]
    
    var i = 1
    
    while i < nums.count {
        let num = nums[i]
        
        if num > max {
            max_2 = max

            max = num
            index = i
        }
        
        i += 1
    }
    
    // 最大数和第二大数之差，直接增加move次。不必一次一次的。
    let move = max - max_2
    if move == 0 {
        return (index, 1)
    }
    
    return (index, max - max_2)
}

func allEqual(_ nums: [Int]) -> Bool {
    if nums.count == 0 {
        return true
    }
    
    let last = nums[0]
    var i = 1
    
    while i < nums.count {
        let num = nums[i]
        
        if num != last {
            return false
        }
        
        i += 1
    }
    
    return true
}

// right solution
// sum + move * (n - 1) = x * n
// x = min + move
// sum - move = min * n
// move = sum - min * n
func minMoves_2(_ nums: [Int]) -> Int {
    let sum = sumOfArray(nums)
    let min = minOfArray(nums)
    
    let move = sum - min * nums.count
    return move
}

func sumOfArray(_ nums: [Int]) -> Int {
    var result = 0
    for num in nums {
        result += num
    }
    
    return result
}

func minOfArray(_ nums: [Int]) -> Int {

    var min = Int.max
    for num in nums {
        if num < min {
            min = num
        }
    }
    
    return min
}

let nums1 = [83,-14,77,15,93,35,86,-8,-51,-79,62,-73,-10,-41,63,26,40,-74,72,36,-89,68,67,-71,82,30,-38,23,-33,35,29,-98,-78,-42,-31,67,93,-44,-89,-58,-71,73,-79,19,84,37,98,24,15,70,-87,26,-9,80,56,-27,-38,70,96,-19,5,25,-16,27,36,5,-54,29,13,-43,24,-5,82,45,-86,67,-66,64,-57,50,-13,-92,-24,78,88,84,-97,-49,54,99,32,-40,-24,68,39,-88,-74,86,-6,39,95,70,-66,78,-33,-99,-3,2,17,-8,-48,56,1,-20,-14,-59,-35,-11,-56,-81,-60,29,-69,17,-3,71,-19,-25,9,27,67,-44,-3,53,86,65,6,-17,-81,-76,28,-29,32,-71,3,-81,-30,68,8,15,40,49,96,23,-82,-55,-54,-49,21,55,79,-12,64,-72,-59,50,93,0,-66,64,24,14,87,-44,43,-9,-73,65,-41,36,-68,51,-63,-72,-25,-93,-26,21,-42,95,-71,-63,-65,93,-82,-72,43,-89,28,29,76,-96,-57,63,-87,38,-94,-60,4,-82,28,-12,69,17,17,96,24,43,-30,83,-10,-1,72,25,-56,90,5,39,54,86,-31,-18,42,-36,97,7,55,-96,48,-89,-78,-72,-1,43,46,68,40,-78,11,-90,-95,-99,-39,30,-22,5,20,36,-56,-74,22,-35,8,-84,-18,-42,24,-63,-38,-76,-100,-64,-48,-1,79,50,-32,-29,73,31,-19,30,33,-6,-40,63,99,81,-1,96,59,73,-87,-32,90,-5,26,-34,-16,40,-10,-16,76,42,36,7,-55,56,79,-82,-13,-88,48,72,-41,-91,36,-90,42,87,-94,1,13,72,21,-45,-81,99,21,4,39,-89,40,-33,5,-72,27,50,84,-42,20,-76,-78,-31,96,-19,-70,-16,-8,72,-28,-50,-75,85,-78,-1,-60,-58,-2,13,-2,90,24,90,-91,81,-81,36,32,55,94,-96,79,69,-27,76,-50,-45,-40,42,79,-16,93,-95,-79,67,4,-87,61,54,26,-41,44,-98,-98,6,84,-79,-58,-32,28,89,-28,8,58,-2,-64,-92,53,-52,3,33,33,-52,-10,54,67,46,68,29,0,-54,88,97,-51,90,3,-67,63,-3,-47,-8,-14,25,52,96,75,88,57,29,-64,-40,-86,21,-40,4,-72,-73,-50,48,56,2,94,-3,-1,-57,-61,-98,-72,-97,0,-19,-53,38,59,51,35,34,39,-8,-85,27,4,-71,-51,64,-15,-71,43,35,77,0,-62,71,49,-11,67,88,-8,95,43,44,-71,90,-18,40,41,69,-74,-68,-39,-58,60,17,-77,61,-19,9,90,-75,96,67,-23,-66,-10,-74,24,-43,-86,68,-95,58,12,86,0,46,26,94,16,52,78,29,46,-10,-53,70,-49,-20,-69,93,-43,-73,12,-14,-86,55,12,-10,-88,-21,-90,69,89,-26,55,-59,-80,-67,87,-12,38,66,70,-16,-44,-83,-94,-40,-51,-63,-95,-41,-83,18,45,83,-27,-42,-27,-63,-11,-17,-93,-22,57,14,-29,29,0,-41,-82,-62,-75,88,-26,-67,57,-19,-7,58,-30,-1,-83,-61,69,63,-78,94,73,-53,-69,-38,-18,90,-8,91,-43,15,21,57,74,-9,47,51,-69,-79,37,40,-46,-70,-2,25,-19,16,16,-98,-69,39,96,-96,38,80,-82,-79,70,-38,-88,79,77,-15,36,4,76,-17,-93,59,-43,44,-1,11,27,50,-64,60,-82,5,63,-51,-56,11,-95,34,-9,75,55,-86,89,68,93,18,-95,-18,-78,82,17,-70,-7,74,26,93,-14,-47,43,-26,-86,13,79,77,62,75,-12,19,10,32,-6,-83,46,-65,37,-9,53,43,73,28,25,-9,10,-82,-83,-64,63,-45,-10,-42,30,4,71,-39,-67,-15,89,-27,-96,-49,-95,-50,-32,3,-15,-94,95,-61,49,20,67,-74,63,-23,96,81,-35,60,-64,55,70,18,-89,42,32,96,79,21,-30,84,72,-73,-66,-60,-17,-28,98,-70,-37,47,50,-70,73,14,-41,22,-53,24,-18,-65,-68,-96,54,-57,-2,-14,-60,-22,59,-38,-38,-17,-59,-52,23,24,-28,22,54,35,-79,-43,65,47,71,76,-31,-82,1,3,-47,33,7,59,28,-94,97,20,-16,8,34,-2,91,76,-2,15,-48,71,89,59,6,-90,-84,-76,9,39,-100,78,9,-47,-19,14,38,89,-74,-33,47,-77,87,-69,32,22,-19,-25,-50,79,90,-46,50,31,-87,-43,-6,81,-19,-97,20,-67,82,81,-13,-85,-4,-75,-96,22,-8,51,-3,-68,34,81,6,-85,-43,8,95,99,62,-3,-17,76,54,77,9,87,32,82,-79,-34,63,-40,-18,-89,-15,-14,-15,30,90,83,14,-24,16,-80,-8,25,28,-61,25,-10,36,60,-82,-57,37,28,82,-79,10,55,-12,-75,-85,70,-63,-47,-92,22,83,50,-43,-3,-73,26,-31,-29,-49,49,10,28,-61,98,-12,-90,93,77,-10,76,99,52,31,-13,77,-1,-43,66,52,-83,-59,35,68,-2,84,95,76,-95,-34,-72,54,28,8,93,-22,97,55,-28,74,-55,-100,25,97,-17,-88,27,82,-79]

print(nums1.count)

let nums = [4,8,1,0,2]
print(minMoves_2(nums1))
print(maxIndex([8,8,5,4,6]))
