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
                print(tmp)
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

let graph = [[4],[3],[3],[],[1]]
let s = Solution()
print(s.allPathsSourceTarget(graph))

