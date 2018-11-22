// https://leetcode.com/problems/quad-tree-intersection/submissions/
// Definition for a QuadTree node.
class Node {
public:
    bool val;
    bool isLeaf;
    Node* topLeft;
    Node* topRight;
    Node* bottomLeft;
    Node* bottomRight;

    Node() {}

    Node(bool _val, bool _isLeaf, Node* _topLeft, Node* _topRight, Node* _bottomLeft, Node* _bottomRight) {
        val = _val;
        isLeaf = _isLeaf;
        topLeft = _topLeft;
        topRight = _topRight;
        bottomLeft = _bottomLeft;
        bottomRight = _bottomRight;
    }
};

class Solution {
public:
    Node* intersect(Node* quadTree1, Node* quadTree2) {
        // 叶子节点
        if (quadTree1->isLeaf) {
            // 如果为true，则直接返回；否则返回tree2，因为x | F = x
            return quadTree1->val ? quadTree1 : quadTree2;
        }

        if (quadTree2->isLeaf) {
            return quadTree2->val ? quadTree2 : quadTree1;
        }

        auto tl = intersect(quadTree1->topLeft, quadTree2->topLeft);
        auto tr = intersect(quadTree1->topRight, quadTree2->topRight);
        auto bl = intersect(quadTree1->bottomLeft, quadTree2->bottomLeft);
        auto br = intersect(quadTree1->bottomRight, quadTree2->bottomRight);

        // 值都相同，并且为叶子节点
        if (tl->isLeaf && tr->isLeaf && bl->isLeaf && br->isLeaf
        && tl->val == tr->val && tr->val == bl->val && bl->val == br->val) {
            return new Node(tl->val, true, NULL, NULL, NULL, NULL);
        } 

        // 否则还可以细分
        return new Node(false, false, tl, tr, bl, br);
    }
};