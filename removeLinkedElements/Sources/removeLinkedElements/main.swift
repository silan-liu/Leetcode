// https://leetcode.com/problems/remove-linked-list-elements/submissions/
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    var description: String {
        var p: ListNode? = self
        var str = ""
        while p != nil {
            str += String(p!.val)
            if p?.next != nil {
                str += "->"
            }
            
            p = p?.next
        }
        
        return str
    }
}

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if let head = head {
            let dummyHead = ListNode(0)
            dummyHead.next = head
            
            var p: ListNode? = dummyHead
            while p != nil, p?.next != nil {
                if p!.next?.val == val {
                    p?.next = p?.next?.next
                }
                else {
                    p = p!.next
                }
            }
            
            return dummyHead.next
        }
        
        return nil
    }
}

let node1 = ListNode(1)
let node2 = ListNode(1)
let node3 = ListNode(1)
let node4 = ListNode(1)
let node5 = ListNode(1)
let node6 = ListNode(5)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6

let s = Solution()
print(s.removeElements(node1, 2)?.description ?? "")

