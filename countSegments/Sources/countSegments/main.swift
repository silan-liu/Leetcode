// https://leetcode.com/problems/number-of-segments-in-a-string/submissions/
func countSegments(_ s: String) -> Int {
    let substring = s.split(separator: " ")
    return substring.count
}
