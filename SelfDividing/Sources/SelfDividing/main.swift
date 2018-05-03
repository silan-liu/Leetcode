 func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {

     var list = [Int]()

     var number = left
     while number <= right {
         if isSelfDividing(number) {
             list.append(number)
         }

         number += 1
     }

     return list
}

func isSelfDividing(_ number: Int) -> Bool {
    var a = number
    var result = true

    while a > 0 {
        // 取最后一位
        let b = a % 10
        print("b: \(b)")

        if b == 0 || number % b != 0 {
            result = false
            break
        }

        a = a / 10
    }

    return result
}

print("\(isSelfDividing(128))"
)
let list = selfDividingNumbers(1, 22)
print("\(list)")
