// https://leetcode.com/problems/unique-email-addresses/submissions/
class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        if emails.isEmpty {
            return 0
        }
        
        
        var result = Set<String>()
        for email in emails {
            let validEmail = translateEmail(email)
            print(validEmail)
            result.insert(validEmail)
        }
        
        return result.count
    }
    
    func translateEmail(_ email: String) -> String {
        if email.isEmpty {
            return ""
        }
        
        // @ 分割
        let splits = email.split(separator: "@")
        if splits.count == 2 {
            let local = splits[0]
            let domain = splits[1]
            
            let array = Array(local)
            
            var validLocal = ""
            
            // 去除 .
            var i = 0
            while i <= array.count - 1 {
                let ch = array[i]
                if ch == "+" {
                    break
                } else if ch != "." {
                    validLocal.append(ch)
                }
 
                i += 1
            }
            
            return validLocal + "@" + domain
            
        } else {
            assert(false, "not valid email")
            return ""
        }
    }
}

let emails = ["test.+mail+alex@leetcode.com","te+st.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
let s = Solution()
print(s.numUniqueEmails(emails))
