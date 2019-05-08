
#coding=utf-8

# https://leetcode.com/problems/n-ary-tree-postorder-traversal/submissions/
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children

class Solution(object):
    # 递归
    def postorder(self, root):
        """
        :type root: Node
        :rtype: List[int]
        """
        if root: 
            if len(root.children) > 0: 
                # 后序遍历
                list = []
                for child in root.children:
                    list += self.postorder(child)

                
                list.append(root.val)
                return list

            return [root.val]
        else:
            return []


        # 非递归
        def postorder2(self, root):
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
                if len(top.children) > 0:
                    for child in top.children:
                        stack.append(child)


            queue.reverse()
            return queue
        
