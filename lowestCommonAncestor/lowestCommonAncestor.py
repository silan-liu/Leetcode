#encoding=utf-8
# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

# https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/submissions/
# 88.86%
class Solution(object):
    def lowestCommonAncestor(self, root, p, q):
        """
        :type root: TreeNode
        :type p: TreeNode
        :type q: TreeNode
        :rtype: TreeNode
        """
        
        # 如果是父子关系
        if p.left == q or p.right == q:
            return p

        if q.left == p or q.right == p:
            return q

        path1 = []
        path2 = []

        self.calNodePath(root, p, path1)
        self.calNodePath(root, q, path2)

        minLen = min(len(path1), len(path2))

        last = root
        i = 0
        while i < minLen:
            if path1[i] != path2[i]:
                return last
            last = path1[i]
            i += 1

        return last

    def calNodePath(self, root, node, path):
        if root:
            path.append(root)
            if root.val < node.val:
                self.calNodePath(root.right, node, path)
            elif root.val > node.val:
                self.calNodePath(root.left, node, path)


s = Solution()
root = TreeNode(6)
n2 = TreeNode(2)
n8 = TreeNode(8)

n0 = TreeNode(0)
n4 = TreeNode(4)

n3 = TreeNode(3)
n5 = TreeNode(5)

n4.left = n3
n4.right = n5

n2.left = n0
n2.right = n4

n7 = TreeNode(7)
n9 = TreeNode(9)
n8.left = n7
n8.right = n9

root.left = n2
root.right = n8

print(s.lowestCommonAncestor(root, n2, n9).val)