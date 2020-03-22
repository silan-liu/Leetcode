// 5.66%
var calcEquation = function(equations, values, queries) {

    let results = new Array()
    let map = new Map()
    let i = 0
    while (i < equations.length) {
        const equation = equations[i]
        const value = values[i]

        const ch1 = equation[0]
        const ch2 = equation[1]

        // 记录双向对应关系
        recordValue(map, ch1, ch1, 1)
        recordValue(map, ch2, ch2, 1)
        recordValue(map, ch1, ch2, value)
        recordValue(map, ch2, ch1, 1/value)

        i += 1
    }

    const keys = [...map.keys()]

    let k = 0
    while (k < keys.length) {
        const key = keys[k]
        const subMap = map.get(key)
        const subKeys = [...subMap.keys()]
        let i = 0
        while (i < subKeys.length) {
            let j = 0
            while (j < subKeys.length) {
                const value1 = map.get(key).get(subKeys[j])
                const value2 = map.get(subKeys[i]).get(key)

                recordValue(map, subKeys[i], subKeys[j], value1 * value2)

                j += 1
            }

            i += 1
        }

        k += 1
    }

    i = 0
    while (i < queries.length) {
        const query = queries[i]

        if (map.has(query[0])) {
            const subMap = map.get(query[0])
            if (subMap.has(query[1])) {
                const result = subMap.get(query[1])
                results.push(result)
            } else {
                results.push(-1)
            }
        } else {
            results.push(-1)
        }
       
        i += 1
    }

    return results
};

// 记录对应关系
var recordValue = function(map, ch1, ch2, value) {
    let subMap
    if (map.has(ch1)) {
        subMap = map.get(ch1)
    } else {
        subMap = new Map()
        map.set(ch1, subMap)
    }

    subMap.set(ch2, value)
}

const equations = [ ["a", "b"], ["b", "c"], ["c", "d"] ],
values = [2.0, 3.0, 4.0],
queries = [["a", "d"]]
console.log(calcEquation(equations, values, queries))
