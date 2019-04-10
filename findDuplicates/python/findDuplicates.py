#coding=utf-8

class Solution(object):
    def findDuplicates(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        res = []
        
        # 逐个遍历，将 num 所对应的 index 设置为负数。
        for num in nums:
            positiveNum = abs(num)
            
            # 已经置为负数，说明有相同的数
            if nums[positiveNum-1] < 0:
                res.append(positiveNum)
            else:
                nums[positiveNum-1] *= -1
        return res


s = Solution()
nums = [4,3,2,7,8,2,3,1]
print(s.findDuplicates(nums))