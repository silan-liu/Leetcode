"""
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children
"""

# https://leetcode.com/problems/maximum-depth-of-n-ary-tree/submissions/
class Solution(object):
    # 27.06%
    def maxDepth(self, root):
        """
        :type root: Node
        :rtype: int
        """
        q1 = []
        level = 0

        if root != None:
            q1.append(root)

        while len(q1) > 0:
            level += 1

            q2 = []

            for val in q1:
                for child in val.children:
                    q2.append(child)

            q1 = q2

        return level

    

    def maxDepth3(self, root):
        if root == None:
            return 0
        
        depth = 0
        for child in root.children:
            depth = max(depth, self.maxDepth3(child))

        return depth + 1