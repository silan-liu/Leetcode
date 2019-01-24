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

/**
 * Your MyLinkedList object will be instantiated and called as such:*/
 let index = 1
 let val = 3
 let obj = MyLinkedList()
 let ret_1: Int = obj.get(index)
 obj.addAtHead(val)
 obj.addAtTail(val)
 obj.addAtIndex(index, val)
 obj.deleteAtIndex(index)
 
 var list = [1]
 list.insert(2, at: 1)