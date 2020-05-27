
// Definition for a binary tree node.
function TreeNode(val) {
    this.val = val;
    this.left = this.right = null;
}

/**
 * @param {TreeNode} root
 * @param {TreeNode} target
 * @param {number} K
 * @return {number[]}
 */
// https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/
// 29.96%
var distanceK = function (root, target, K) {
    if (root) {
        let nodeList = []
        // 先计算以 target 开始的
        const result = distance(target, 0, K)
        nodeList = nodeList.concat(result)

        // 再计算路径上的节点
        const pathList = getPath(root, target)
        console.log(pathList)

        if (pathList && pathList.length > 0) {
            let i = 0
            while (i < pathList.length) {
                const value = pathList[i]
                const { node, dir } = value

                // 刚好等于 K
                if (pathList.length - i === K) {
                    nodeList.push(node.val)
                } else {
                    // 找子树
                    let startNode = null
                    if (dir === 0) {
                        startNode = node.right
                    } else {
                        startNode = node.left
                    }
    
                    // 剩余长度
                    const remainDistance = K - (pathList.length - i + 1)
                    const result = distance(startNode, 0, remainDistance)

                    nodeList = nodeList.concat(result)
                }

                i += 1
            }
        }

        return nodeList
    }

    return []
};

// 找到 root -> target 之间的路径，不包括 target
var getPath = function (root, target) {
    if (root) {
        if (root == target) {
            return []
        } else {
            let result1 = null
            let result2 = null

            // 左边是否存在节点
            if (root.left) {
                result1 = getPath(root.left, target)
            }
            
            // 右边是否存在节点
            if (root.right) {
                result2 = getPath(root.right, target)
            }

            if (result1) {
                // 0 代表左边节点
                const curNode = { node: root, dir: 0 }
                return [curNode].concat(result1)
            } else if (result2) {
                // 1 代表右边节点
                const curNode = { node: root, dir: 1 }
                return [curNode].concat(result2)
            }

            // 都不存在
            return null
        }
    }

    return null
}

// 以 node 开始的，长度为 totalDistance 的节点
var distance = function (node, curDistance, totalDistance) {

    console.log(node.val, curDistance, totalDistance)
    if (node) {
        if (curDistance === totalDistance) {
            return [node.val]
        }

        let result = []
        if (node.left) {
            const leftResult = distance(node.left, curDistance + 1, totalDistance)
            result = result.concat(leftResult)
        }

        if (node.right) {
            const rightResult = distance(node.right, curDistance + 1, totalDistance)
            result = result.concat(rightResult)
        }        

        return result
    }

    return []
}

const root = new TreeNode(1)
const n1 = new TreeNode(2)
const n2 = new TreeNode(3)
const n3 = new TreeNode(4)
const n4 = new TreeNode(5)
const n5 = new TreeNode(6)
const n6 = new TreeNode(7)

root.left = n1
root.right = n2
n1.left = n3
n1.right = n5
n2.left = n6
n2.right = n4

console.log(distanceK(root, n5, 4))
