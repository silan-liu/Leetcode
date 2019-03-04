// https://leetcode.com/problems/partition-labels/submissions/
class Solution {
    var map = [Character: [Int]]()
    func partitionLabels(_ S: String) -> [Int] {
        let list = Array(S)
        print(list.count)

        var i = 0
        while i < list.count {

            let char = list[i]
            var indexes: [Int]? = map[char]
            if indexes == nil {
                indexes = [Int]()
            }

            indexes!.append(i)
            map[char] = indexes!

            i += 1
        }

        var result = [Int]()
        var last = [Int]()

        i = 0
        while i < list.count {
            let char = list[i]
            print(char)
            if let indexes = map[char] {
                if indexes.count == 1 {
                    if last.count >= 2 {
                        let index = indexes[0]
                        if index > last.first!, index < last.last! {
                            i += 1
                            continue
                        }
                    }

                    if last.count != 0 {
                        result.append(last.last! - last.first! + 1)
                        last = []
                    }

                    result.append(1)
                    i += 1
                } else if indexes.count > 1 {
       
                    let union = unionIndex(last, indexes)
                    print(union)
                    if union.isEmpty {
                        // 无相交
                        result.append(last.last! - last.first! + 1)
                        last = []

                    } else {
                        last = union

                        if last.last! == list.count - 1 {
                            result.append(last.last! - last.first! + 1)
                            break
                        }

                        i += 1
                    }

                    print("result:\(result)")
                }
            }
        }

        return result
    }

    func unionIndex(_ index1: [Int], _ index2: [Int]) -> [Int] {
        if index1.count == 0 {
            return index2
        }

        if index2.count == 0 {
            return index1
        }

        if index1.count > 1, index2.count > 1 {
            // 无交叉
            if index1.last! < index2.first! || index2.last! < index1.first! {
                return []
            }

            let start = min(index1[0], index2[0])
            let end = max(index1.last!, index2.last!)

            return [start, end]
        }

        return []
    }
}

let s = Solution()
let S = "ababcbacadefegdehijhklijwwx"
print(s.partitionLabels(S))