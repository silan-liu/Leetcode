//https://leetcode.com/problems/most-common-word/description/
import Foundation
func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
    
    let lowercaseParagraph = paragraph.lowercased()
    
    let list = lowercaseParagraph.split(separator: " ")
    var map = [String: Int]()
    
    for str in list {
        var tmp = String(str)
        
        // !?',;.
        tmp = tmp.replacingOccurrences(of: " ", with: "")
        tmp = tmp.replacingOccurrences(of: ",", with: "")
        tmp = tmp.replacingOccurrences(of: "!", with: "")
        tmp = tmp.replacingOccurrences(of: "?", with: "")
        tmp = tmp.replacingOccurrences(of: "'", with: "")
        tmp = tmp.replacingOccurrences(of: ";", with: "")
        tmp = tmp.replacingOccurrences(of: ".", with: "")
        
        if let count = map[tmp] {
            map[tmp] = count + 1
        } else {
            map[tmp] = 1
        }
    }
    
    // delete banned words
    for ban in banned {
        if map.keys.contains(ban) {
            map.removeValue(forKey: ban)
        }
    }
    
    // sort by count descending
    let sortedMap = map.sorted(by: { (v1, v2) in
        return v1.1 > v2.1
    })
    
    if let first = sortedMap.first {
        return first.key
    }
    
    return ""
}

func mostCommonWord_2(_ paragraph: String, _ banned: [String]) -> String {
    
    let lowercaseParagraph = paragraph.lowercased()
    
    let list = lowercaseParagraph.split(separator: " ")
    var map = [String: Int]()
    var maxCount = 0
    var mostCommonWord = ""
    
    for str in list {
        var tmp = String(str)
        
        // !?',;.
        tmp = tmp.replacingOccurrences(of: " ", with: "")
        tmp = tmp.replacingOccurrences(of: ",", with: "")
        tmp = tmp.replacingOccurrences(of: "!", with: "")
        tmp = tmp.replacingOccurrences(of: "?", with: "")
        tmp = tmp.replacingOccurrences(of: "'", with: "")
        tmp = tmp.replacingOccurrences(of: ";", with: "")
        tmp = tmp.replacingOccurrences(of: ".", with: "")
        
        if !banned.contains(tmp) {
            var count = 1
            if let value = map[tmp] {
                count = value + 1
            }
            
            map[tmp] = count
            
            if maxCount > count {
                maxCount = count
                mostCommonWord = tmp
            }
        }
    }
    
    return mostCommonWord
}

let paragraph = "Bob hit a ball, b' b' the hit BALL flew far after it was hit."
let banned = ["hit", "ball"]

print(mostCommonWord(paragraph, banned))
