public class App {
    public static void main(String[] args) throws Exception {
        Solution s = new Solution();
        int[] arr = { 0, 1, 2, 3, 4, 5 };

        int result = s.maxChunksToSorted(arr);
        System.out.println(result);
    }
}
