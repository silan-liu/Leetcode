// https://leetcode.com/problems/remove-duplicates-from-sorted-list/description/
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if let head = head {
            var cur: ListNode = head
            var p = head.next
            while p != nil {
                if p?.val == cur.val {
                    // delete
                    cur.next = p?.next
                } else {
                    cur = p!
                }
                
                p = p?.next
            }
            
            return head
        } else {
            return nil
        }
    }
}

let head = ListNode(1)
let n2 = ListNode(1)
let n3 = ListNode(2)
let n4 = ListNode(3)
let n5 = ListNode(2)
let n6 = ListNode(3)

head.next = n2
n2.next = n3
n3.next = n4
n4.next = n5
n5.next = n6

let s = Solution()
var result = s.deleteDuplicates(head)
while result != nil {
    print(result?.val)
    result = result?.next
}

