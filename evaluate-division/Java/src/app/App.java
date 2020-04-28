// package app;

public class App {
    public static void main(String[] args) throws Exception {

        String[][] equations = {{"a", "b"}, {"b", "c"}};
        double[] values = {1.0, 2.0};
        String[][] queries = {{"a", "a"}, {"a", "c"}};

        Solution s = new Solution();
        double[] results = s.calcEquation(equations, values, queries);

        for (double result : results) {
            System.out.println(result);
        }
    }
}
