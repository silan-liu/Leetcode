// https://leetcode.com/problems/network-delay-time/
func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
    // 存储节点间的距离
    var map = [Int: [[Int]]]()
    
    for time in times {
        let node1 = time[0]
        let node2 = time[1]
        let distance = time[2]
        
        var value = map[node1]
            
        if value == nil {
           value = [[Int]]()
        }
        
        var list = [Int]()
        list.append(node2)
        list.append(distance)

        value?.append(list)
        
        map[node1] = value
    }
    
    // 存储节点i与节点K的距离
    var dist = [Int: Int]()
    var i = 1
    while i <= N {
        if i == K {
            dist[i] = 0
        } else {
            dist[i] = Int.max
        }
        i += 1
    }
    
    // 求k点到每个节点的最短路径
    
    // 标志节点是否被处理
    var flag = [Bool]()
    i = 1
    while i <= N {
        flag.append(false)
        i += 1
    }
    
    
    var found = -1
    var j = 1

    while j <= N {
        i = 1
        
        // 找到与k最近的节点
        var max = Int.max

        while i <= N {
            let distance = dist[i]!
            if !flag[i - 1] && distance < max {
                max = distance
                found = i
            }
            
            i += 1
        }
        
        // 没有找到
        if found == -1 {
            break
        }
        
        flag[found - 1] = true
        
        // 更新计算从k经过found后，k与各节点的距离
        // 取出与found相邻的节点
        if let list = map[found] {
            for item in list {
                let node = item[0]
                let distance = item[1]
                
                // node节点与k的原始距离
                let originDistance = dist[node]!
                
                // 找到的节点与k的距离
                let foundNodeDistance = dist[found]!
                
                // 取最小距离（经过found节点与远距离）
                let newDistance = min(originDistance, foundNodeDistance + distance)
                
                dist[node] = newDistance
            }
        }
        
        j += 1
    }
    
    var result = -1
    for value in dist.values {
        if value == Int.max {
            return -1
        } else if value > result {
            result = value
        }
    }
    
    return result
}

let times = [[2,4,1],[2,3,1],[3,4,1]],
N = 4,
K = 2

print(networkDelayTime(times, N, K))
