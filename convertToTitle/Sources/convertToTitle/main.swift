// https://leetcode.com/problems/excel-sheet-column-title/submissions/
func convertToTitle(_ n: Int) -> String {
    let map = [1:"A", 2:"B", 3:"C", 4:"D", 5:"E", 6:"F", 7:"G", 8:"H", 9:"I", 10:"J", 11:"K",
    12:"L", 13:"M", 14:"N", 15:"O", 16:"P", 17:"Q", 18:"R", 19:"S", 20:"T", 21:"U", 22:"V", 23:"W",
    24:"X", 25:"Y", 26:"Z"]
    
    var result = ""
    var tmp = n
    while tmp != 0 {
        var m = tmp % 26

        // 如果是26的整数，则需要留下26，因为没有0对应的字母。比如52-->AZ, 52/26 = 2, 则末尾是26，前面是2-1对应A
        if m == 0 {
            let d = tmp / 26
            m = 26
            tmp = d - 1
        } else {
            tmp = tmp / 26
        }


        if let str = map[m] {
            result.append(str)
        }
        print(tmp, m)
    }

    return String(result.reversed())
}

print(convertToTitle(26))