// https://leetcode.com/problems/k-closest-points-to-origin/submissions/
class Solution {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        var distanceMap = [Int: [Int]]()
        var distanceList = [Int]()

        var i = 0
        while i < points.count {
            let point = points[i]

            if point.count == 2 {
                let distance = point[0] * point[0] + point[1] * point[1]
                distanceList.append(distance)

                var indexList = distanceMap[distance]
                if indexList == nil {
                    indexList = [Int]()
                }

                indexList!.append(i)
                distanceMap[distance] = indexList
            }

            i += 1
        }

        // 初始化
        var heap = [Int]()
        i = 0
        while i < K, i < distanceList.count {
            heap.append(distanceList[i])
            i += 1
        }

        // 构建大根堆, 从下往上调整
        i = K / 2 - 1
        while i >= 0 {
            adjustHeap(&heap, i)
            i -= 1
        }
 
        i = K
        while i < distanceList.count {
            // 如果比最大的数小，则替换
            if distanceList[i] < heap[0] {
                heap[0] = distanceList[i]
                adjustHeap(&heap, 0)
            }

            i += 1
        }

        var result = [[Int]]()
        for distance in heap {
            if var indexList = distanceMap[distance] {
                if indexList.count > 0 {
                    let index = indexList[0]
                    if index < points.count {
                        result.append(points[index])
                    }

                    indexList.remove(at: 0)
                    distanceMap[distance] = indexList
                }
            }
        }

        return result
    }

    func adjustHeap(_ list: inout [Int], _ i: Int) {
        var j = i
        while j < list.count {
            var next = j
            let distance = list[j]
            if 2 * j + 1 < list.count, list[next] < list[2 * j + 1] {
                next = 2 * j + 1
            }

            if 2 * j + 2 < list.count, list[next] < list[2 * j + 2] {
                next = 2 * j + 2
            }

            if next != j {
                // swap
                let tmp = list[next]
                list[next] = distance
                list[j] = tmp

                j = next
            } else {
                break
            }
        }
    }
}

class Solution2 {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        
        // 初始化
        var heap = [[Int]]()
        var i = 0
        while i < K, i < points.count {
            heap.append(points[i])
            i += 1
        }
        
        // 构建大根堆, 从下往上调整
        i = K / 2 - 1
        while i >= 0 {
            adjustHeap(&heap, i)
            i -= 1
        }
        
        i = K
        while i < points.count {
            // 如果比最大的数小，则替换
            if getDistance(points[i]) < getDistance(heap[0]) {
                heap[0] = points[i]
                adjustHeap(&heap, 0)
            }
            
            i += 1
        }

        return heap
    }
    
    func adjustHeap(_ list: inout [[Int]], _ i: Int) {
        var j = i
        while j < list.count {
            var next = j
            if 2 * j + 1 < list.count, getDistance(list[next]) < getDistance(list[2 * j + 1]) {
                next = 2 * j + 1
            }
            
            if 2 * j + 2 < list.count, getDistance(list[next]) < getDistance(list[2 * j + 2]) {
                next = 2 * j + 2
            }
            
            if next != j {
                // swap
                let tmp = list[next]
                list[next] = list[j]
                list[j] = tmp
                
                j = next
            } else {
                break
            }
        }
    }
    
    func getDistance(_ point: [Int]) -> Int {
        if point.count == 2 {
            return point[0] * point[0] + point[1] * point[1]
        }
        
        return Int.max
    }
}

let s = Solution()
let s2 = Solution2()

let points = [[-2,10],[-4,-8],[10,7],[-4,-7],[1,1]]
let k = 3
print(s.kClosest(points, k))

print(s2.kClosest(points, k))
