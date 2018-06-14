// https://leetcode.com/problems/two-sum-iv-input-is-a-bst/description/
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

class Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        return find(root, root, k)
    }
    
    func find(_ root: TreeNode?, _ node: TreeNode?, _ k: Int) -> Bool {
        if let node = node {
            // 在遍历过程中应该去除当前正在使用的node
            if findValue(root, k - node.val, node) {
                return true
            }
            
            if find(root, node.left, k) {
                return true
            }
            
            if find(root, node.right, k) {
                return true
            }
        }
        
        return false
    }
    
    func findValue(_ root: TreeNode?, _ value: Int, _ exceptNode: TreeNode?) -> Bool {
        if let root = root {
            let rootPointer = unsafeBitCast(root, to: UnsafeRawPointer.self)
            let nodePointer = unsafeBitCast(exceptNode, to: UnsafeRawPointer.self)

            // 避开当前node，如[1]，k=2，如果从1开始遍历，需要去除1这个节点。
            if root.val == value && rootPointer != nodePointer {
                return true
            } else if root.val < value {
                return findValue(root.right, value, exceptNode)
            } else {
                return findValue(root.left, value, exceptNode)
            }
        }
        
        return false
    }
    
    func buildBST(_ array: [Int]) -> TreeNode? {
        if array.count == 0 {
            return nil
        }
        
        let first = array[0]
        
        let root: TreeNode = TreeNode(first)
        
        for i in 1..<array.count {
            insertValue(root, array[i])
        }
        
        return root
    }
    
    func insertValue(_ root: TreeNode?, _ value: Int) {
        if let root = root {
            if root.val < value {
                if root.right == nil {
                    let node = TreeNode(value)
                    root.right = node
                } else {
                    // 找右边
                    insertValue(root.right, value)
                }
                
            } else if root.val > value {
                if root.left == nil {
                    let node = TreeNode(value)
                    root.left = node
                } else {
                    // 找左边
                    insertValue(root.left, value)
                }
            }
        }
    }
}
 
 let array = [1]
 let s = Solution()
 let node = s.buildBST(array)
 let result = s.findTarget(node, 2)
 print(result)
