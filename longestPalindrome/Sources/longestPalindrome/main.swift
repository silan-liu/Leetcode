// https://leetcode.com/problems/longest-palindrome/description/
func longestPalindrome(_ s: String) -> Int {
    var map = [Character: Int]()
    
    for c in s {
        if let value = map[c] {
            let count = value + 1
            map[c] = count
        } else {
            map[c] = 1
        }
    }
    
    var result = 0
    var flag = false
    
    // n个偶数/n个偶数+单个
    for (_, value) in map {
        if value % 2 != 0 {
            // 奇数
            result += value - 1
            flag = true
        } else {
            result += value
        }
    }
    
    // 有奇数个字符，因为已经取了其偶数个，ddd fffff, 取了dd,ffff，加上一个字符，即是最长的回文。
    if flag {
        return result + 1
    }
    
    return result
}

let s = "abccccddhhfkkfjdskfjdksjfkdjfjjkslooppppqiiiiejmmmnndjjjslioiewiooiwioeriwjfkdjfklsjfklsjfksjfkiiieiwioioqadsjjdjdsiuyriewyuriehfhsjfhdjfhjsdfhjdskfsfafdtewtwetqffafx"
print(longestPalindrome(s))
