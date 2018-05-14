
// https://leetcode.com/problems/fizz-buzz/description/
func fizzBuzz(_ n: Int) -> [String] {
    if n < 1 {
        return []
    }
    
    var result = [String]()
    
    var index = 1
    
    while index <= n {
        if index % 15 == 0 {
            result.append("FizzBuzz")
        } else if index % 3 == 0 {
            result.append("Fizz")
        } else if index % 5 == 0{
            result.append("Buzz")
        } else {
            result.append(String(index))
        }
        
        index += 1
    }
    
    return result
}

print(fizzBuzz(15))
