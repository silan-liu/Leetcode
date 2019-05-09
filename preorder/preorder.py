
#coding=utf-8

# https://leetcode.com/problems/n-ary-tree-preorder-traversal/submissions/
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children



class Solution(object):
    def preorder(self, root):
        """
        :type root: Node
        :rtype: List[int]
        """
        if root: 
            if len(root.children) > 0: 
                list = [root.val]

                for child in root.children:
                    list += self.preorder(child)

                return list

            return [root.val]
        else:
            return []


    # 非递归
    def preorder2(self, root):
        """
        :type root: Node
        :rtype: List[int]
        """

        queue = []
        stack = []
        if root:
            stack.append(root)

        while len(stack) > 0:
            # pop
            top = stack.pop()

            # 放到结果数组
            queue.append(top.val)

            # children push
            children = top.children
            if len(children) > 0:
                i = len(children) - 1
                while i >= 0:
                    stack.append(children[i])
                    i -= 1

        return queue