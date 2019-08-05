// https://leetcode.com/problems/flower-planting-with-no-adjacent/
class Solution {
    // 79.71% 
    func gardenNoAdj(_ N: Int, _ paths: [[Int]]) -> [Int] {
        
        // 存储相邻的花园
        var adjMap = [Int: [Int]]()
        
        var result = [Int]()
        
        var i = 0
        while i < N {
            result.append(0)
            i += 1
        }
        
        for path in paths {
            let x = path[0]
            let y = path[1]
            
            // 正反向都存储
            if var list = adjMap[x] {
                list.append(y)
                adjMap[x] = list
            } else {
                adjMap[x] = [y]
            }
            
            if var list = adjMap[y] {
                list.append(x)
                adjMap[y] = list
            } else {
                adjMap[y] = [x]
            }
        }
        
        let flowers = Set<Int>([1,2,3,4])

        i = 1
        while i <= N {
            var plantedFlowers = Set<Int>()
            
            if let list = adjMap[i], list.count > 0 {
                for j in list {
                    // 已经种了花
                    if result[j - 1] != 0 {
                        plantedFlowers.insert(result[j - 1])
                    }
                }
            }

            let substracting = flowers.subtracting(plantedFlowers)
            if substracting.count > 0 {
                result[i - 1] = substracting.first!
            }
            
            i += 1
        }
        
        return result
    }
}

let s = Solution()
let N = 4, paths = [[1,2],[3,4]]
print(s.gardenNoAdj(N, paths))
