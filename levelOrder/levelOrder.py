# https://leetcode.com/problems/n-ary-tree-level-order-traversal/
"""
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children
"""
class Solution(object):
    #  70.67%
    def levelOrder(self, root):
        """
        :type root: Node
        :rtype: List[List[int]]
        """
        items = []
        result = []
        if root:
            items.append(root)
            result.append([root.val])

        i = 0
        count = len(items)
        levelList = []
        while i < count:
            node = items[i]

            for child in node.children:
                levelList.append(child.val)
                items.append(child)

            i += 1

            # 更新，一层遍历完成
            if i == count:
                if len(levelList) > 0:
                    result.append(levelList)
                count = len(items)
                levelList = []

        return result


        