// https://leetcode.com/problems/baseball-game/description/

func calPoints(_ ops: [String]) -> Int {
    var sum = 0
    
    var lastPoints =  [Int]()

    for op in ops {
        if let num = Int(op) {
            lastPoints.append(num)

            // add point
            sum += num
        } else if op == "C" {
            // remove last point
            if let lastPoint = lastPoints.last {
                lastPoints.removeLast()
                
                sum -= lastPoint
            }
            
        } else if op == "D" {
            if let lastPoint = lastPoints.last {
                // double
                let point = 2 * lastPoint
                
                lastPoints.append(point)
                
                sum += point
            }
        } else if op == "+" {
            if lastPoints.count >= 2 {
                let last1 = lastPoints[lastPoints.count - 1]
                let last2 = lastPoints[lastPoints.count - 2]
                
                let point = last1 + last2
                
                lastPoints.append(point)
                
                sum += point
            }
        }
    }
    
    return sum
}

print(calPoints(["8373","C","9034","-17523","D","1492","7558","-5022","C","C","+","+","-16000","C","+","-18694","C","C","C","-19377","D","-25250","20356","C","-1769","-8303","C","-25332","29884","C","+","C","-29875","-15374","C","+","14584","13773","+","17037","-28248","+","16822","D","+","+","-19357","-26593","-8548","4776","D","-8244","378","+","-19269","-25447","18922","-16782","2886","C","-17788","D","-22256","C","308","-9185","-19074","1528","28424","D","8658","C","7221","-13704","8995","-21650","22567","-29560","D","-9807","25632","6817","28654","D","-18574","C","D","20103","7875","C","9911","23951","C","D","C","+","18219","-20922","D","-24923"]))
