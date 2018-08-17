 // https://leetcode.com/problems/rectangle-overlap/description/
 func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
    guard rec1.count == 4, rec2.count == 4 else {
        return false
    }
    
    var x1 = rec1[0]
    var y1 = rec1[1]
    var x2 = rec1[2]
    var y2 = rec1[3]
    
    var p1 = [x1,y2]
    var p2 = [x2,y2]
    var p3 = [x1,y1]
    var p4 = [x2,y1]
    
    if pointInRectangle(p1, rec2) || pointInRectangle(p2, rec2) || pointInRectangle(p3, rec2) || pointInRectangle(p4, rec2) {
        return true
    }
    
    x1 = rec2[0]
    y1 = rec2[1]
    x2 = rec2[2]
    y2 = rec2[3]
    
    p1 = [x1,y2]
    p2 = [x2,y2]
    p3 = [x1,y1]
    p4 = [x2,y1]
    
    if pointInRectangle(p1, rec1) || pointInRectangle(p2, rec1) || pointInRectangle(p3, rec1) || pointInRectangle(p4, rec1) {
        return true
    }
    
    if edgeOverlap(rec1, rec2) || edgeOverlap(rec2, rec1) {
        return true
    }
    
    return false
 }
 
 func pointInRectangle(_ point: [Int], _ rec: [Int]) -> Bool {
    if point.count == 2, rec.count == 4 {
        let x = point[0]
        let y = point[1]
        
        let x1 = rec[0]
        let y1 = rec[1]
        let x2 = rec[2]
        let y2 = rec[3]
        
        if x < x2 && x > x1 && y > y1 && y < y2 {
            return true
        }
    }
    
    return false
 }
 
 // 有2条对边重合
 func edgeOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
    guard rec1.count == 4, rec2.count == 4 else {
        return false
    }
    
    let x11 = rec1[0]
    let y11 = rec1[1]
    let x21 = rec1[2]
    let y21 = rec1[3]
    
    let x12 = rec2[0]
    let y12 = rec2[1]
    let x22 = rec2[2]
    let y22 = rec2[3]
    
    // 完全相等
    if x11 == x12 && y11 == y12 && x21 == x22 && y21 == y22 {
        return true
    }
    
    if x11 > x12 && x11 < x22 && y21 >= y22 && y11 <= y12 {
        return true
    }
    
    if y11 > y12 && y11 < y22 && x21 >= x22 && x11 <= x12 {
        return true
    }
    
    return false
 }
 
 // 通过计算面积
 func isRectangleOverlap_2(_ rec1: [Int], _ rec2: [Int]) -> Bool {
    guard rec1.count == 4, rec2.count == 4 else {
        return false
    }
    
    let height = min(rec1[3], rec2[3]) - max(rec1[1], rec2[1])
    let width = min(rec1[2], rec2[2]) - max(rec1[0], rec2[0])
    
    return height * width > 0
 }
 
 let rec1 = [7,8,13,15], rec2 = [10,8,12,20]
 print(isRectangleOverlap(rec1, rec2))
