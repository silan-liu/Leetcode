// 100.00%
public class Solution {
    public int maxChunksToSorted(int[] arr) {
        if (arr != null && arr.length > 0) {

            // 保存当前位置最大值
            int[] maxNum = new int[arr.length];
            int max = Integer.MIN_VALUE;
            int result = 0;

            for (int i = 0; i < arr.length; i++) {
                // 计算最大值
                max = Math.max(max, arr[i]);
                maxNum[i] = max;
            }

            for (int i = 0; i < maxNum.length; i++) {

                // 如果刚好等于排序后的数字，则可以单独成块
                if (maxNum[i] == i) {
                    result += 1;
                }
            }

            return result;
        }

        return 0;
    }
}