// https://leetcode.com/problems/merge-two-sorted-lists/description/
public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
 }
 
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var p1 = l1
        var p2 = l2
        
        var result: ListNode? = nil
        var p: ListNode? = nil
        
        while p1 != nil, p2 != nil {
            let v1 = p1!.val
            let v2 = p2!.val
            
            if v1 < v2 {
                let node = ListNode(v1)

                if result == nil {
                    result = node
                    p = result
                } else {
                    p?.next = node
                    p = node
                }
                
                p1 = p1?.next
            } else if v1 > v2 {
                let node = ListNode(v2)

                if result == nil {
                    result = node
                    p = result
                } else {
                    p?.next = node
                    p = node
                }
                
                p2 = p2?.next
            } else {
                let node1 = ListNode(v1)
                let node2 = ListNode(v2)

                if result == nil {
                    result = node1
                    p = result
                } else {
                    p?.next = node1
                    p = node1
                }
                
                p?.next = node2
                
                p = node2
                
                p1 = p1?.next
                p2 = p2?.next
            }
        }
        
        while p1 != nil {
            let node = ListNode(p1!.val)

            if result == nil {
                result = node
                p = result
            } else {
                p?.next = node
                p = node
            }
           
            p1 = p1?.next
        }
        
        while p2 != nil {
            let node = ListNode(p2!.val)
            
            if result == nil {
                result = node
                p = result
            } else {
                p?.next = node
                p = node
            }
            
            p2 = p2?.next
        }
        
        return result
    }
}
