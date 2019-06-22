// https://leetcode.com/problems/longest-word-in-dictionary/
class Solution {
    // 找到最长的单词，其前缀是否能被其他单词匹配，100.00%
    func longestWord(_ words: [String]) -> String {
        var ans = ""
        var set = Set<String>()
        
        for word in words {
            set.insert(word)
        }
        
        for word in words {
            // 比已有的单词长，或者长度相等，但排序在前
            if word.count > ans.count || (word.count == ans.count && word < ans) {
                var good = true
                var i = 0
                while i < word.count {
                    // 0...k
                    let start = word.index(word.startIndex, offsetBy: 0)
                    let end = word.index(word.startIndex, offsetBy: i)
                    let substring = String(word[start...end])
                    
                    if !set.contains(substring) {
                        good = false
                        break
                    }
                    
                    i += 1
                }
                
                if good {
                    ans = word
                }
            }
        }
        
        return ans
    }
}

class TrieNode {
    var data: Character
    var isEnd: Bool
    var children: [TrieNode?]
    
    init(_ c: Character, _ end: Bool = false) {
        data = c
        isEnd = end
        
        children = [TrieNode?]()
        var i = 0
        while i < 26 {
            children.append(nil)
            i += 1
        }
    }
}

class Trie {
    var root = TrieNode("/")
    
    // 插入字符串
    func insert(_ str: String) {
        var node = root
        for c in str {
            let aIndex = Character("a").toInt()
            let index = c.toInt() - aIndex
            
            if index >= 0 && index < 26 {
                if node.children[index] == nil {
                    let insertNode = TrieNode(c)
                    node.children[index] = insertNode
                    
                    node = insertNode
                } else {
                    node = node.children[index]!
                }
            }
        }
        
        node.isEnd = true
    }
    
    // 是否能找到一个完整的单词
    func canBuild(_ str: String) -> Bool {
        var node = root
        for c in str {
            let aIndex = Character("a").toInt()
            let index = c.toInt() - aIndex
            
            if index >= 0 && index < 26 {
                if let child = node.children[index] {
                    
                    if child.isEnd == false {
                        return false
                    }
                    
                    node = child
                } else {
                    return false
                }
            }
        }
        
        return true
    }
}

class Solution2 {
    var trie = Trie()
    
    // 7.41%
    func longestWord(_ words: [String]) -> String {
        for word in words {
            trie.insert(word)
        }
        
        var result = ""
        
        for word in words {
            if trie.canBuild(word) {
                if word.count > result.count {
                    result = word
                } else if word.count == result.count {
                    if word < result {
                        result = word
                    }
                }
            }
        }
        
        return result
    }
}

extension Character
{
    func toInt() -> Int
    {
        var intFromCharacter:Int = 0
        for scalar in String(self).unicodeScalars
        {
            intFromCharacter = Int(scalar.value)
        }
        return intFromCharacter
    }
}

let s = Solution()
let s2 = Solution2()

let words = ["a", "banana", "app", "appl", "ap", "apply", "apple"]
print(s.longestWord(words))
print(s2.longestWord(words))
