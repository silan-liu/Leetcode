// https://leetcode.com/problems/string-without-aaa-or-bbb/submissions/
func strWithout3a3b(_ A: Int, _ B: Int) -> String {
    
    var len = B

    var count = 0
    var i = 0
    var str = ""
    var list = [Character]()
    
    // 首先2个a配一个b
    while i < A {
        str += "a"
        list.append("a")

        count += 1

        if count == 2 {
            // 添加间隔
            if len > 0 {
                str += "b"
                list.append("b")

                len -= 1
            }

            count = 0
        }

        i += 1
    }

    // 如果b有剩余
    if len > 0 {
        var j = 0
        while j < list.count, len > 0 {
            if j == 0 && list[j] == "a" {
                // 可直接插入b
                list.insert("b", at: 0);
                len -= 1
            } else {
                if list[j] == "a" {
                    list.insert("b", at: j + 1)
                    j += 1
                    len -= 1
                } else if list[j] == "b" {
                    // 如果前后都不是b，则可以插入
                    var flag = true
                    if j - 1 >= 0, list[j - 1] == "b" {
                        flag = false
                    }
                    
                    if j + 1 < list.count, list[j + 1] == "b" {
                        flag = false
                    }
                    
                    if flag {
                        list.insert("b", at: j + 1)
                        len -= 1
                    }
                    
                    j += 1
                }
            }
        }

        // 直接加在末尾
        if len > 0 {
            j = 0
            while j < len {
                list.append("b")
                j += 1
            }
        }
    }
    
   let result = String(list)
   return result
}

print(strWithout3a3b(6,3))
