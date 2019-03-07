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
            // print(char)
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
                    // print(union)
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

                    // print("result:\(result)")
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

// 更简单的方法
class Solution2 {
    func partitionLabels(_ S: String) -> [Int] {
        let list = Array(S)
        var map = [Character: Int]()

        var result = [Int]()
        var i = 0

        // 记录字符的最后下标
        while i < list.count {
            map[list[i]] = i
            i += 1
        }

        i = 0
        var j = 0
        var start = 0
        while i < list.count {
            if let index = map[list[i]] {
                // 记录一段最大index，因为如果字符出现多次，找到的肯定是最远的位置。依次遍历，求出最远位置。
                if index > j {
                    j = index
                }

                // 则表示遍历到了一段的最后
                if i == j {
                    result.append(i - start + 1)

                    // 重新记录start
                    start = i + 1
                }
            }

            i += 1
        }

        return result
    }
}

let s = Solution()
let s2 = Solution2()

let S = "ababcbacadefegdehijhklijwwx"
print(s.partitionLabels(S))
print(s2.partitionLabels(S))