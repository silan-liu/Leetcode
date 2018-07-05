public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
 }

func reverseList(_ head: ListNode?) -> ListNode? {
    var next: ListNode? = nil
    var tmp = head
    
    // 将元素往前插
    while tmp != nil {
        let node = ListNode(tmp!.val)
        
        node.next = next

        print(node.val)
        
        // 记录头结点
        next = node
        
        tmp = tmp?.next
    }
    
    return next
}

var head = ListNode(1)
var tmp: ListNode = head
for i in 2...5 {
    let node = ListNode(i)
    tmp.next = node
    
    tmp = node
}

tmp.next = nil

let _ = reverseList(head)
 
