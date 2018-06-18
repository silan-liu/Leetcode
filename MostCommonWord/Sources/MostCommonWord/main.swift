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
    
    for ban in banned {
        if map.keys.contains(ban) {
            map.removeValue(forKey: ban)
        }
    }
    
    let sortedMap = map.sorted(by: { (v1, v2) in
        return v1.1 > v2.1
    })
    
    if let first = sortedMap.first {
        return first.key
    }
    
    return ""
}

let paragraph = "Bob hit a ball, the hit BALL flew far after it was hit."
let banned = ["hit", "ball"]

print(mostCommonWord(paragraph, banned))
