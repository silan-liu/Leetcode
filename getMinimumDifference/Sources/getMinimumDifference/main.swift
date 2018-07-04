// https://leetcode.com/problems/minimum-absolute-difference-in-bst/description/
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

func getMinimumDifference(_ root: TreeNode?)    -> Int {
    var list = [Int]()
    
    // 转换成数组，因为是bst，所以一定是升序排序
    transformToArray(root, &list)
    
    var minDiff = Int.max
    
    if list.count > 0 {
        var i = 0
        while i < list.count - 1 {
            let diff = list[i + 1] - list[i]
            if  diff < minDiff {
                minDiff = diff
            }
            
            i += 1
        }
    }
    
    return minDiff
}

func transformToArray(_ root: TreeNode?, _ array: inout [Int]) {
    if let root = root {
        if root.left != nil {
            transformToArray(root.left, &array)
        }
        
        array.append(root.val)
        
        if root.right != nil {
            transformToArray(root.right, &array)
        }
    }
}

let root = TreeNode(4)
let right = TreeNode(8)
right.left = TreeNode(7)
root.right = right

var list = [Int]()
transformToArray(root, &list)
print(list)

print(getMinimumDifference(root))

 
