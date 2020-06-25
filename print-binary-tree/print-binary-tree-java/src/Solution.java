import java.util.ArrayList;
import java.util.List;

// 99.54%
class Solution {

  public List<List<String>> printTree(TreeNode root) {
    int height = getHeight(root);

    // 列数等于满二叉树最后一行的节点数
    int cols = (2 << (height - 1)) - 1;

    // 初始化数组
    List<List<String>> list = new ArrayList<List<String>>();

    int i = 0;
    while (i < height) {
      List<String> row = new ArrayList<String>();
      int j = 0;
      while (j < cols) {
        row.add("");
        j += 1;
      }

      list.add(row);
      i += 1;
    }

    // 填充数组
    fillArray(root, list, 0, height, 0, cols - 1);

    return list;
  }

  /**
   * 填充数组
   * 
   * @param root      根节点
   * @param list      数组
   * @param row       当前行
   * @param rowsCount 总行数
   * @param l         左边界列
   * @param r         右边界列
   */
  private void fillArray(TreeNode root, List<List<String>> list, int row, int rowsCount, int l, int r) {
    if (root == null || row == rowsCount) {
      return;
    }

    // 根节点位置，在中间
    int mid = (l + r) / 2;
    list.get(row).set(mid, Integer.toString(root.val));

    // 左子树，右边界为 mid - 1
    fillArray(root.left, list, row + 1, rowsCount, l, mid - 1);

    // 右子树，左边界为 mid + 1
    fillArray(root.right, list, row + 1, rowsCount, mid + 1, r);
  }

  /**
   * 获取树的高度
   * 
   * @param root 根节点
   * @return 树的高度
   */
  private int getHeight(TreeNode root) {
    if (root != null) {

      int leftHeight = getHeight(root.left);
      int rightHeight = getHeight(root.right);

      return Math.max(leftHeight, rightHeight) + 1;
    }

    return 0;
  }
}