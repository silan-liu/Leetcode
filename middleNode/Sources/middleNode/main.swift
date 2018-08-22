// https://leetcode.com/problems/middle-of-the-linked-list/description/
public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
}
 
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        if let head = head {
            var tmp: ListNode? = head
            
            var count = 0
            while tmp != nil {
                count += 1
                tmp = tmp?.next
            }
            
            tmp = head
            var index = 0
        
            while index < count / 2 {
                tmp = tmp?.next
                index += 1
            }
            
            return tmp
        }
        
        return nil
    }
}
