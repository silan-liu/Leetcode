// 思路：求ops前后元素的交集，因为都是以(0,0)为顶点，所以依次操作下来，交集部分会最大[r,c]。最大数个数=r*c
// 也可转换成：找到ops中最小的row,column相乘
func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
    if ops.count >= 1 {
        let firstOp = ops[0]
        var result = firstOp
        
        for op in ops {
            guard let value = intersection(result, op) else {
                return 0
            }
            
            result = value
        }
        
        return result[0] * result[1]
    }
    
    return m * n
}

// 求两次操作的交集，这部分会成为最大的数
func intersection(_ last: [Int], _ next: [Int]) -> [Int]? {
    if last.count != 2 || last.count != next.count {
        return nil
    }
    
    let last1 = last[0]
    let last2 = last[1]
    
    let next1 = next[0]
    let next2 = next[1]
    
    let value0 = last1 < next1 ? last1 : next1
    let value1 = last2 < next2 ? last2 : next2
    return [value0, value1]
}

let operations = [[2,2],[3,3]]

print(maxCount(3, 3, operations))
