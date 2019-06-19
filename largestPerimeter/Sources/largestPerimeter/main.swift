// https://leetcode.com/problems/largest-perimeter-triangle/submissions/
class Solution {
    // 11.11%
    func largestPerimeter(_ A: [Int]) -> Int {
        let sortedA = A.sorted { (a, b) -> Bool in
            return a > b
        }
        
        var i = 0
        while i <= sortedA.count - 3 {
            
            if isTriangle(sortedA[i], sortedA[i+1], sortedA[i+2]) {
                return sortedA[i] + sortedA[i+1] + sortedA[i+2]
            }
            
            i += 1
        }
        
        return 0
    }
    
    func isTriangle(_ a: Int, _ b: Int, _ c: Int) -> Bool {
        if a + b > c, a + c > b, c + b > a {
            return true
        }
        
        return false
    }
    
    //24.44%
    func largestPerimeter2(_ A: [Int]) -> Int {
        let sortedA = A.sorted { (a, b) -> Bool in
            return a > b
        }
        
        var i = 0
        while i <= sortedA.count - 3 {
            
            if sortedA[i+1] + sortedA[i+2] > sortedA[i] {
                return sortedA[i] + sortedA[i+1] + sortedA[i+2]
            }
            
            i += 1
        }
        
        return 0
    }
}

let s = Solution()
let A = [3,6,2,3]
print(s.largestPerimeter(A))
print(s.largestPerimeter2(A))
