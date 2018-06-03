print("Hello, world!")

func addDigits(_ num: Int) -> Int {
    if num >= 0 && num <= 9 {
        return num
    }
    
    var tmp = num
    var sum = 0
    while tmp != 0 {
        let last = tmp % 10
        tmp = tmp / 10
        
        sum += last
    }
    
    return addDigits(sum)
}

print(addDigits(38))
