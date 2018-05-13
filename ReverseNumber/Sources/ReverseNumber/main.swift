
// https://leetcode.com/problems/reverse-integer/description/

func reverse(_ x: Int) -> Int {
    let max = 2147483647
    let min = -2147483648

    var tmp = x
    var list = [Int]()
    var sum = 0

    var result = 0

    while tmp != 0 {
        let last = tmp % 10
        list.append(last)
        tmp = tmp / 10    

        // 另一种方式
        result = result * 10 + last
    }

    print("result:\(result)")

    if list.count > 0 {
        var i = list.count - 1
        var multiple = 1

        while i >= 0 {
            let num = list[i]
            sum += num * multiple
            i -= 1

            multiple *= 10
        }
    }

    // overflow return 0
    if sum > max || sum < min {
        return 0
    }

    return sum        
}

let result = reverse(-123)
print("\(result)")

