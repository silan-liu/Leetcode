import Foundation

func largestTriangleArea(_ points: [[Int]]) -> Double {
    let count = points.count
    var i = 0
    var maxArea: Double = 0.0
    
    while i < count {
        var j = i + 1
        while j < count {
            var k = j + 1
            while k < count {
                maxArea = max(maxArea, area(points[i], points[j], points[k]))
                k += 1
            }
            
            j += 1
        }
        
        i += 1
    }
    
    return maxArea
}

func area(_ p1: [Int], _ p2: [Int], _ p3: [Int]) -> Double {
    if p1.count != 2 || p2.count != 2 || p3.count != 2 {
        return 0.0
    }
    
    // 沿着三角形顶点画出刚好包裹住其的长/正方形(即顶点在长方形边上)，用长方形的面积-其他几个直角三角形的面积。
    // 面积计算公式s= 0.5 * (x1y2 + x2y3 + x3y1 - x1y3 - x2y1 - x3y2)
    let a = p1[0] * p2[1] + p2[0] * p3[1] + p3[0] * p1[1]
    let b = p1[0] * p3[1] + p2[0] * p1[1] + p3[0] * p2[1]
    let area = 0.5 * Double(abs(a - b))
    
    return area
}

let points = [[0,0],[0,1],[1,0],[0,2],[2,0]]

print(largestTriangleArea(points))
