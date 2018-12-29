// https://leetcode.com/problems/length-of-last-word/submissions/
func lengthOfLastWord(_ s: String) -> Int {
     if s.count == 0 {
         return 0
     }

     let list = s.split(separator: " ")
     if list.count > 0 {
         return list.last!.count
     }

     return 0
}

func lengthOfLastWord_2(_ s: String) -> Int {
     if s.count == 0 {
         return 0
     }

     var i = s.count - 1
     var count = 0
     // 遇到字母
     var flag = false
     let list = Array(s)
     while i >= 0 {         
         let char = list[i]
         if char != " " {
             count += 1
             flag = true
         } else {
             if flag {
                 break
             }
         }

         i -= 1
     }

     return count
}

let s = "hello world fd "
print(lengthOfLastWord(s))
print(lengthOfLastWord_2(s))