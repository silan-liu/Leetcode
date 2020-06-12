/**
 * @param {string} bottom
 * @param {string[]} allowed
 * @return {boolean}
 */
// https://leetcode.com/problems/pyramid-transition-matrix/
// 82.35%
var pyramidTransition = function (bottom, allowed) {
  let allowMap = new Map();
  allowed.forEach((element) => {
    // 取前 2 位
    const prefix = element.slice(0, 2);
    const value = element[2];

    let list;
    if (allowMap.has(prefix)) {
      list = allowMap.get(prefix);
    } else {
      list = new Array();
    }

    list.push(value);
    allowMap.set(prefix, list);
  });

  console.log(allowMap);
  return dfs(bottom, 0, "", allowMap);
};

var dfs = function (bottom, i, str, map) {
  if (bottom.length === 1) {
    return true;
  }

  // 当前层的最后一个，需换到下一层
  if (i === bottom.length - 1) {
    console.log("nextlevel", str);
    return dfs(str, 0, "", map);
  }

  const prefix = bottom.slice(i, i + 2);
  console.log(prefix);
  if (map.has(prefix)) {
    const list = map.get(prefix);

    let j = 0;
    while (j < list.length) {
      const b = list[j];

      // 找下一个块
      if (dfs(bottom, i + 1, str + b, map)) {
        return true;
      }

      j += 1;
    }
  }

  return false;
};

const bottom = "AABA";
const allowed = ["AAA", "AAB", "ABA", "ABB", "BAC"];
console.log(pyramidTransition(bottom, allowed));
