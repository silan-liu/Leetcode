
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
            
            // 无论链表长度为偶数还是奇数，都为n/2的节点；当为奇数，则正好是中间的节点。
            if p1 == nil {
                return false
            }
            
            // 这里不能用字符串来比较，因为如果是负数，反转后不相等，但是空间复杂度为O(n)
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
    
    // 第二种方式，反转前半段链表
    func isPalindrome_2(_ head: ListNode?) -> Bool {
        // 通过快慢指针找到中间节点的下一节点，正好是后半部分的开始
        if let head = head {
            
            var p1: ListNode? = head
            var p2: ListNode? = head
            var last: ListNode? = nil
            var current: ListNode? = head
            
            while p2 != nil, p2?.next != nil {
                current = p1
                p1 = p1?.next
                p2 = p2?.next?.next
                
                // 改变指向，逐步反转
                current?.next = last
                last = current
            }
            
            // p1是后半部分
            // 如果链表为奇数，p1需要往后移动一个节点，即中间节点的后一个。
            if p2 != nil, p2?.next == nil {
                p1 = p1?.next
            }
            
            // p2是前半部分反转链表的头
            p2 = current
            
            while p1 != nil {
                if p1?.val != p2?.val {
                    return false
                }
                p1 = p1?.next
                p2 = p2?.next
            }
            
            return true
        }
        
        return true
    }
    
    // 第三种方式，遍历链表，用栈存储元素的值，然后从头开始遍历链表，对比栈顶元素。空间复杂度O(n)
    func isPalindrome_3(_ head: ListNode?) -> Bool {
        if let head = head {
            var stack = [Int]()
            
            var p: ListNode? = head
            while p != nil {
                stack.append(p!.val)
                p = p?.next
            }
            
            p = head
            while p != nil {
                if p?.val != stack.last {
                    return false
                }
                
                stack.removeLast()
                p = p?.next
            }
            
            return stack.isEmpty
        }
        
        return true
    }
}

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(2)
let node4 = ListNode(2)
let node5 = ListNode(1)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

let obj = Solution()
print(obj.isPalindrome(node1))
print(obj.isPalindrome_3(node1))
print(obj.isPalindrome_2(node1))
