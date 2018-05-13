
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    func printDesc() {
        print(val)

        left?.printDesc()
        right?.printDesc()
    }
}

class Solution {
    func trimBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> TreeNode? {
        var results = [Int]()
        
        findNodesOutOfRange(root, L, R, &results)
        
        var newRoot = root
        for val in results {
            newRoot = deleteNode(newRoot, val)
        }
        
        return newRoot
    }
    
    func findNodesOutOfRange(_ root: TreeNode?, _ L: Int, _ R: Int, _ results: inout [Int]) {
        if let root = root {
            if root.val < L || root.val > R {
                results.append(root.val)
            }
            
            findNodesOutOfRange(root.left, L, R, &results)
            findNodesOutOfRange(root.right, L, R, &results)
        }
    }
    
    func recursive(_ root: inout TreeNode?, _ node: TreeNode?, _ L: Int, _ R: Int) {
        if node == nil {
            return
        }
        else if let node = node {
            if node.val < L || node.val > R {
                print("delete node \(node.val)")
                root = deleteNode(root, node.val)
            }
            
            recursive(&root, node.left, L, R)
            recursive(&root, node.right, L, R)
        }
    }
    
    func createBST(_ values: [Int]) -> TreeNode? {
        if values.count == 0 {
            return nil
        }
        
        var root: TreeNode? = nil
        for value in values {
            root = insertNode(root, value)
        }
        
        return root
    }
    
    func insertNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        if root == nil {
            let node = TreeNode(key)
            return node
        } else {
            
            if let root = root {
                if root.val < key {
                    root.right = insertNode(root.right, key)
                } else if root.val > key {
                    root.left = insertNode(root.left, key)
                }
            }
            
            return root
        }
    }
    
    @discardableResult
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        
        if let root = root {
            
            if key < root.val {
                root.left = deleteNode(root.left, key)
            } else if key > root.val {
                root.right = deleteNode(root.right, key)
            } else {
                // 有左右子树
                if root.left != nil && root.right != nil {
                    // 找到右子树最小值，root替换为该值，则一定不会破坏规则
                    let min = findMinNode(root.right)
                    
                    root.val = min
                    
                    // 删除右子树最小节点
                    root.right = deleteNode(root.right, min)
                    
                } else if root.left != nil {
                    return root.left!
                } else if root.right != nil {
                    return root.right!
                } else {
                    return nil
                }
            }
        }
        
        return root
    }
    
    func findMinNode(_ node: TreeNode?) -> Int {
        if var node = node {
            while node.left != nil {
                node = node.left!
            }
            
            return node.val
        }
        
        return 0
    }
}

let solution = Solution()
var root = solution.createBST([41,37,44,24,39,42,48,1,35,38,40,43,46,49,0,2,30,36,45,47,4,29,32,3,9,26,31,34,7,11,25,27,33,6,8,10,16,28,5,15,19,12,18,20,13,17,22,14,21,23])

root?.printDesc()

print("trimBST...")
var trimRoot = solution.trimBST(root,25,55)
trimRoot?.printDesc()
