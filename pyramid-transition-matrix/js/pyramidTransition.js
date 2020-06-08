/**
 * @param {string} bottom
 * @param {string[]} allowed
 * @return {boolean}
 */
// https://leetcode.com/problems/pyramid-transition-matrix/
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
      list = new Set();
    }

    list.add(value);
    allowMap.set(prefix, list);
  });

  console.log(allowMap);
};

const bottom = "BCD";
const allowed = ["BCG", "CDE", "GEA", "FFF"];
console.log(pyramidTransition(bottom, allowed));
