
// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// https://leetcode.com/problems/palindrome-linked-list/submissions/
class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        // 通过快慢指针找到中间节点的下一节点，正好是后半部分的开始
        if let head = head {
  
            var p1: ListNode? = head
            var p2: ListNode? = head
            
            while p2 != nil, p2?.next != nil {
                p1 = p1?.next
                p2 = p2?.next?.next
            }
            
            // p1是后半部分
            if p1 == nil {
                return false
            }
            
            // 这里不能用字符串来比较，因为如果是负数，反转后不相等
            var list1 = [Int]()
            var list2 = [Int]()
            
            p2 = head
            
            while p1 != nil {
                if let p1 = p1, let p2 = p2 {
                    list1.append(p1.val)
                    list2.append(p2.val)
                } else {
                    return false
                }
                
                p1 = p1?.next
                p2 = p2?.next
            }
            
            if list1 == list2.reversed() {
                return true
            }
            
            return false
        }
        
        return true
    }
}

let node1 = ListNode(-129)
let node2 = ListNode(-129)
let node3 = ListNode(1)
let node4 = ListNode(2)
let node5 = ListNode(1)

node1.next = node2
//node2.next = node3
//node3.next = node4
//node4.next = node5

let obj = Solution()
print(obj.isPalindrome(node1))
