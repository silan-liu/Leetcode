func subdomainVisits(_ cpdomains: [String]) -> [String] {
    var map = [String: Int]()
    for cpdomain in cpdomains {
        // split by ' '
        let array = cpdomain.split(separator: " ")
        
        if array.count == 2 {
            let count = Int(array[0])
            
            let domain = array[1]
            
            if domain.count > 0 {
                // split by '.'
                let list = domain.split(separator: ".")
                
                let listCount = list.count
                var lastDomain = String(list[listCount - 1])
                if let number = map[lastDomain] {
                    map[lastDomain] = number + count!
                } else {
                    map[lastDomain] = count
                }
                
                var index = listCount - 2
                while index >= 0 {
                    
                    lastDomain = list[index] + "." + lastDomain
                    
                    if let number = map[lastDomain] {
                        map[lastDomain] = number + count!
                    } else {
                        map[lastDomain] = count
                    }
                    
                    index -= 1
                }
            }
        }
    }
    
    var result = [String]()
    for (key, value) in map {
        let desc = String(value) + " " + key
        result.append(desc)
    }
    
    return result
}

let result = subdomainVisits(["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"])

print(result)
