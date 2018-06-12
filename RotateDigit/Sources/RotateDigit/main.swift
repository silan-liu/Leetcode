func rotatedDigits(_ N: Int) -> Int {
    var count = 0
    for i in 1...N {
        if isValid_2(i) {
            count += 1
        }
    }
    
    return count
}

func isValid(_ num: Int) -> Bool {
    var tmp = num
    var changeFlag = false
    
    while tmp != 0 {
        let last = tmp % 10
        tmp = tmp / 10;
        
        // 0,1,8
        if last == 0 || last == 1 || last == 8 {
            // no change
        } else if last == 2 || last == 5 || last == 6 || last == 9 {
            // 2,5 6,9
            changeFlag = true
        } else {
            return false
        }
    }
    
    if changeFlag {
        return true
    }
    
    return false
}

func isValid_2(_ num: Int) -> Bool {
    // 转成string
    let str = String(num)
    
    // 包含2,5,6,9但不包含3,4,7
    if (str.contains("2") || str.contains("5") || str.contains("6") || str.contains("9")) && (!str.contains("4") && !str.contains("7") && !str.contains("3") ) {
        return true
    }
    
    return false
}
print(rotatedDigits(169))
