// https://leetcode.com/problems/design-linked-list/submissions/
class MyLinkedList {
 
    var list = [Int]()

    /** Initialize your data structure here. */
    init() {
           
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
      if index < list.count {
          return list[index]
      }

      return -1
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
      list.insert(val, at: 0)
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
      list.append(val)
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index <= list.count {
            list.insert(val, at: index)
        }
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
      if index < list.count {
          list.remove(at: index)
      }
    }
}

class Node {
    var val: Int
    var next: Node?

    init(_ val: Int) {
        self.val = val
        next = nil
    }
}

class MyLinkedList_1 {
    
    var size: Int
    var dummmyHead: Node 
    var head: Node? {
        return dummmyHead.next
    }

    /** Initialize your data structure here. */
    init() {
        dummmyHead = Node(0)
        size = 0
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        if index >= size {
            return -1
        }

        var i = -1
        var node: Node = dummmyHead
        while i != index {
            node = node.next!
            i += 1
        }

        return node.val
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let node = Node(val)
        let tmp = dummmyHead.next
        dummmyHead.next = node
        node.next = tmp

        size += 1
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        var node = dummmyHead
        while node.next != nil {
            node = node.next!
        }

        node.next = Node(val)

        size += 1
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index <= size {
            var node = dummmyHead
            var i = 0

            while i != index {
                node = node.next!
                i += 1
            }

            let tmp = node.next
            let newNode = Node(val)
            node.next = newNode
            newNode.next = tmp

            size += 1
        }
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if index < size {
            var node = dummmyHead
            var i = 0
            while i != index {
                node = node.next!
                i += 1
            }

            node.next = node.next?.next

            size -= 1
        }
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:*/
 let index = 1
 let val = 3
 let obj = MyLinkedList_1()
 let ret_1: Int = obj.get(index)
 obj.addAtHead(1)
 print(obj.get(0))
 
 obj.addAtTail(2)
  print(obj.get(2))
  

 obj.addAtIndex(index, 3)
    print(obj.get(1))

   print(obj.get(2))
 obj.deleteAtIndex(index)
   print(obj.get(1))
