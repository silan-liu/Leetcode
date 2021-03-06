// https://leetcode.com/problems/second-minimum-node-in-a-binary-tree/description/
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

func findSecondMinimumValue(_ root: TreeNode?) -> Int {
    var min1 = -1
    var min2 = -1
    
    recurserive(root, &min1, &min2)
    
    return min2
}

func recurserive(_ root: TreeNode?, _ min1: inout Int, _ min2: inout Int) {
    if let root = root {
        if root.val < min1 || min1 == -1 {
            min2 = min1
            min1 = root.val
        } else if (root.val < min2 || min2 == -1) && root.val > min1 {
            min2 = root.val
        }
        
        if root.left != nil && root.right != nil {
            recurserive(root.left, &min1, &min2)
            recurserive(root.right, &min1, &min2)
        }
    }
}

func findSecondMinimumValue_2(_ root: TreeNode?) -> Int {
    if let root = root {
        var min2 = Int.max
        
        // root是最小的
        recurserive_2(root, root.val, &min2)
        
        return min2 == Int.max ? -1 : min2
    }
    
    return -1
}

func recurserive_2(_ root: TreeNode?, _ min1: Int, _ min2: inout Int) {
    if let root = root {
        if root.val > min1 && root.val < min2 {
            min2 = root.val
        } else if root.val == min1 {
            recurserive_2(root.left, min1, &min2)
            recurserive_2(root.right, min1, &min2)
        }
    }
}


let root = TreeNode(2)
root.left = TreeNode(2)
root.right = TreeNode(2)

print(findSecondMinimumValue(root))
print(findSecondMinimumValue_2(root))
