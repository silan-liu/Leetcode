// https://leetcode.com/problems/nim-game/description/
// 当自己拿了之后，还剩4颗，肯定会赢
func canWinNim(_ n: Int) -> Bool {
    return n % 4 != 0
}
