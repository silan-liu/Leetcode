// https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/submissions/
//Definition for a binary tree node.
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
    func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? {
        
        if pre.count == post.count {
            if pre.count > 0 {
                // pre 的第一个和 post 的最后一个元素是相等的
                // pre：中左右，post：左右中
                let value = pre[0]
                 let root = TreeNode(value)
                
                if pre.count >= 2 {
                    // 找到其左子树部分
                    let mid = pre[1]
                    var j = 0
                    while j < post.count {
                        if post[j] == mid {
                            break
                        }
                        
                        j += 1
                    }
                    
                    if j != post.count {
                        let leftPre = Array(pre[1...j+1])
                        let leftPost = Array(post[0...j])
                        
                        print("left:\(leftPre), \(leftPost)")
                        
                        root.left = constructFromPrePost(leftPre, leftPost)
                        
                        // 其右子树部分
                        if j + 2 < pre.count {
                            let rightPre = Array(pre[j+2...pre.count-1])
                            let rightPost = Array(post[j+1...post.count-2])
                        
                            print("right:\(rightPre), \(rightPost)")

                            root.right = constructFromPrePost(rightPre, rightPost)
                        }
                    }
                }
                
                return root
            }
        }
        
        return nil
    }
}


func preVisit(_ root: TreeNode?) {
    if let root = root {
        print(root.val)
        preVisit(root.left)
        preVisit(root.right)
    }
}

func postVisit(_ root: TreeNode?) {
    if let root = root {
        postVisit(root.left)
        postVisit(root.right)
        print(root.val)
    }
}

let s = Solution()
let pre = [1,2,4,5,3,6,7]
let post = [4,5,2,6,7,3,1]
let root = s.constructFromPrePost(pre, post)
print("preVisit:=====================")
preVisit(root)

print("postVisit:=====================")
postVisit(root)
