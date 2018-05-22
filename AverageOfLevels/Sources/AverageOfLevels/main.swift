// https://leetcode.com/problems/average-of-levels-in-binary-tree/description/
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
    }
}

func averageOfLevels(_ root: TreeNode?) -> [Double] {
    var queue = [(TreeNode, Int)]()
    var map = [Int: [TreeNode]]()
    var result = [Double]()
    
    if let root = root {
        result.append(Double(root.val))
        
        queue.append((root, 0))
        
        // 横向遍历，map记录所有level的节点
        while queue.count > 0 {
            let (node, level) = queue[0]
            queue.removeFirst()
            
            if let left = node.left {
                if var nodes = map[level + 1] {
                    nodes.append(left)
                    map[level + 1] = nodes
                } else {
                    var nodes = [TreeNode]()
                    nodes.append(left)
                    
                    map[level + 1] = nodes
                }
                
                queue.append((left, level + 1))
            }
            
            if let right = node.right {
                if var nodes = map[level + 1] {
                    nodes.append(right)
                    map[level + 1] = nodes
                } else {
                    var nodes = [TreeNode]()
                    nodes.append(right)
                    
                    map[level + 1] = nodes
                }
                
                queue.append((right, level + 1))
            }
        }
        
        // 按层排序
        let sortedMap = map.sorted(by: {
            $0.0 < $1.0
        })
        
        // 计算每层的平均值
        for (_, value) in sortedMap {
            if value.count == 0 {
                continue
            }
            
            var sum: Double = 0
            for item in value {
                sum += Double(item.val)
            }
            
            let average = sum / Double(value.count)
            
            result.append(average)
        }
        
        return result
    } else {
        return [0]
    }
}

func averageOfLevels_2(_ root: TreeNode?) -> [Double] {
    var queue = [TreeNode]()
    var result = [Double]()
    
    if let root = root {
        queue.append(root)
        
        while queue.count > 0 {
            
            var sum: Int = 0
            var count = 0
            var tmp = [TreeNode]()
            
            while queue.count > 0 {
                let node = queue[0]
                queue.removeFirst()
                
                sum += node.val
                count += 1
                
                if let left = node.left {
                    tmp.append(left)
                }
                
                if let right = node.right {
                    tmp.append(right)
                }
            }
            
            queue = tmp
            
            result.append(Double(sum) / Double(count))
        }
    }
    
    return result
}

