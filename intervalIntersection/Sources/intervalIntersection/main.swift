
// https://leetcode.com/problems/interval-list-intersections/submissions/
// Definition for an interval.
 public class Interval {
   public var start: Int
   public var end: Int
   public init(_ start: Int, _ end: Int) {
     self.start = start
     self.end = end
   }
}
 
class Solution {
    func intervalIntersection(_ A: [Interval], _ B: [Interval]) -> [Interval] {
        var result = [Interval]()

        var i = 0
        var j = 0
        while i < A.count, j < B.count {
            let a = A[i]
            let b = B[j]

            let flag = isIntersect(a, b)
            if flag == -1 {
              j += 1
            } else if flag == -2 {
              i += 1
            } else if flag == 0 {
              if let interval = calculateInterval(a, b) {
                result.append(interval)
              }

              i += 1
            } else if flag == 1 {

              if let interval = calculateInterval(a, b) {
                result.append(interval)
              }

              j += 1
            }
        }

        return result        
    }

    // b与a是否相交， -1 为不相交b在a前，-2为b在a后不想交；0 为头部相交， 1 为尾部相交。若头尾都相交，则只返回 1 。
    func isIntersect(_ a: Interval, _ b: Interval) -> Int {

        if b.end < a.start {
          return -1
        }

        if b.start > a.end {
          return -2
        }
        
        // 先要计算尾部
        // b 的尾部 在 a 里面
        if b.end >= a.start, b.end <= a.end {
           return 1
        }
        
        // b 的头在 a 里面
        if b.start >= a.start, b.start <= a.end {
            return 0
        }

        // a 尾部 在 b 里面
        if a.end >= b.start, a.end <= b.end {
           return 0
        }

        return -1
    }

    // 计算相交区间
    func calculateInterval(_ a: Interval, _ b: Interval) -> Interval? {
        if b.end < a.start || b.start > a.end {
          return nil
        }

        let start = max(a.start, b.start)
        let end = min(a.end, b.end)

        return Interval(start, end)
    }
}

let s = Solution()
let A = [Interval(0,2), Interval(5,10), Interval(13,23), Interval(24,28)]
let B = [Interval(1,2), Interval(8,9), Interval(15,17), Interval(22,29)]

let list = s.intervalIntersection(A, B)
for i in list {
  print("\(i.start)-\(i.end)")
}
