// https://leetcode.com/problems/largest-time-for-given-digits/submissions/
// 以h1表示小时第一位，h2表示小时第二位。h1=0,1, h2=[0-9]; h1=2, h2=[0-3]
// 分钟：m1=[0-5], m2=[0-9] 
var list = [String]()

func recursive(_ A: [Int], _ index: Int, _ result: String) {
    if index == 4 {
        if !list.contains(result) {
            list.append(result)
        }
    }

    // 递归计算出所有符合贵族的字符串
    var i = 0
    while i < A.count {
        let a = A[i]
        
        if index == 0 {
            // 0-2
            if a < 0 || a > 2 {
                i += 1
                continue
            }
        } else if index == 1 {
            let first = String(result.first!)
            if first == "0" || first == "1" {
                // 0-9
                if a < 0 || a > 9 {
                    i += 1
                    continue
                }
            } else if first == "2" {
                // 0-3
                if a < 0 || a > 3 {
                    i += 1
                    continue
                }
            }
        } else if index == 2 {
            if a < 0 || a > 5 {
                i += 1
                continue
            }
        } else if index == 3 {
            if a < 0 || a > 9 {
                i += 1
                continue
            }
        }

        var tmp = result + String(a)
        if index == 1 {
            tmp += ":"
        }

        var tmpList = A
        tmpList.remove(at: i)
        recursive(tmpList, index + 1, tmp)

        i += 1
    }
}

func largestTimeFromDigits(_ A: [Int]) -> String {

    if A.count != 4 {
        return ""
    }

    recursive(A, 0, "")

    if list.count == 0 {
        return ""
    }

    var maxString = ""
    for str in list {
        if str > maxString {
            maxString = str
        }
    }

    return maxString
}

let nums = [1,2,3,5]
print(largestTimeFromDigits(nums))
// print(recursive(nums, 0, ""))
// print(list)
// print(list.count)
