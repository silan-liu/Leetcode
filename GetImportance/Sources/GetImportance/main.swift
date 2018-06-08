struct Employee {
    var id: Int
    var importance: Int
    var subordinates: [Int]
}

class Solution {
    var map = [Int: Employee]()

    func getImportance(employees: [Employee], id: Int) -> Int {
        
        for employee in employees {
            map[employee.id] = employee
        }
        
        var importance = 0
        
        recursiveCalImportance(id: id, importance: &importance)
        
        return importance
    }
    
    func recursiveCalImportance(id: Int, importance: inout Int) {
        if let employee = map[id] {
            importance += employee.importance
            
            let subordinates = employee.subordinates
            if subordinates.count > 0 {
                for subordinate in subordinates {
                    recursiveCalImportance(id: subordinate, importance: &importance)
                }
            }
        }
    }
}

let e1 = Employee(id: 1, importance: 5, subordinates: [2,3])
let e2 = Employee(id: 2, importance: 3, subordinates: [])
let e3 = Employee(id: 3, importance: 3, subordinates: [5, 4])
let e4 = Employee(id: 4, importance: 3, subordinates: [])
let e5 = Employee(id: 5, importance: 1, subordinates: [])

let solution = Solution()
let importance = solution.getImportance(employees: [e1, e2, e3, e4, e5], id: 1)
print(importance)
