// https://leetcode.com/problems/all-paths-from-source-to-target/submissions/
class Solution {
    var paths = [[Int]]()

    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var result = [Int]()
        recursive(graph, 0, &result)

        return paths
    }

    func recursive(_ graph:[[Int]], _ i: Int,  _ result: inout [Int]) {
        if graph.count > 0 {
            if i >= 0, i < graph.count {
                var tmp = result
                tmp.append(i)

                let list = graph[i]
                if list.count > 0 {
                    for j in list {
                        if j > i, j < graph.count {
                            recursive(graph, j, &tmp)
                        } else {
                            paths.append(tmp)
                            break
                        }
                    }
                } else {
                    paths.append(tmp)
                }
            }
        }
    }
}

class Solution2 {
    var paths = [[Int]]()

    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var result = [Int]()
        result.append(0)

        recursive(graph, 0, &result)
        return paths
    }

    func recursive(_ graph:[[Int]], _ i: Int,  _ result: inout [Int]) {
        if i == graph.count - 1 {
            paths.append(result)
            return
        }

        let list = graph[i]
        for j in list {
            result.append(j)
           
            recursive(graph, j, &result)

            // 回溯时需要remove，因为用的是同一个result变量，每次都append了新的值。
            result.removeLast()

            // or 每次都创建新的变量
            // var tmp = result
            // tmp.append(j)
            // recursive(graph, j, &tmp)
        }
    }
}

let graph = [[2], [3], [3], [],[]] 
let s = Solution()
let s2 = Solution2()

print(s.allPathsSourceTarget(graph))
print(s2.allPathsSourceTarget(graph))

