/**
 * @param {string[][]} equations
 * @param {number[]} values
 * @param {string[][]} queries
 * @return {number[]}
 */
// 72.25% , https://leetcode.com/problems/evaluate-division
// 全局变量，存结果
var queryResult = -1
var calcEquation = function(equations, values, queries) {

    let results = new Array()
    let map = new Map()
    let i = 0
    while (i < equations.length) {
        const equation = equations[i]
        const value = values[i]

        const ch1 = equation[0]
        const ch2 = equation[1]

        recordValue(map, ch1, ch2, value)
        recordValue(map, ch2, ch1, 1/value)

        i += 1
    }

    console.log(map)

    i = 0
    while (i < queries.length) {
        const query = queries[i]

        queryResult = -1

        let set = new Set()
        recursive(query[0], query[1], -1, map, set)

        results.push(queryResult)

        i += 1
    }

    return results
};

var recordValue = function(map, ch1, ch2, value) {
    let list
    if (map.has(ch1)) {
        list = map.get(ch1)
    } else {
        list = new Array()
        map.set(ch1, list)
    }

    const obj = {
        ch: ch2,
        value: value
    }

    list.push(obj)
}

var recursive = function(ch1, ch2, result, map, set) {

    // 如果字符都存在
    if (map.has(ch1) && map.has(ch2)) {
        if (ch1 === ch2) {
            queryResult = result * -1
            return
        }

        const list = map.get(ch1)
        let i = 0

        // 记录已访问的 key，避免死循环，因为 map 中记录的是双向对应关系, a->[b], b->[a]
        set.add(ch1)

        while (i < list.length) {
            const obj = list[i]

            if (!set.has(obj.ch)) {
                const value = obj.value

                recursive(obj.ch, ch2, result * value, map, set)
            }
            
            i += 1
        }
    }
}

const equations = [ ["a", "b"], ["b", "c"] ],
values = [2.0, 3.0],
queries = [ ["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"] ]
console.log(calcEquation(equations, values, queries))