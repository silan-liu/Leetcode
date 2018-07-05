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

func reverseList_2(_ head: ListNode?) -> ListNode? {
    var node: ListNode? = nil
    let _ = recursiveReverseList(head, &node)
    
    return node
}

func recursiveReverseList(_ head: ListNode?, _ result: inout ListNode?) -> ListNode? {
    if let head = head {
        let node = ListNode(head.val)
        let pre = recursiveReverseList(head.next, &result)
        if let pre = pre {
            pre.next = node
        }
        
        // recursiveReverseList(1), ..., recursiveReverseList(5)
        // 记录最后的结点，因为递归，最里层会先调用,即recursiveReverseList(5)会先执行，此时result设置为5这个结点。
        if result == nil {
            result = node
        }
        
        return node
    }
    
    return nil
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
reverseList_2(head)

 
