// https://leetcode.com/explore/learn/card/recursion-i/253/conclusion/1675/

class Solution {
    func kthGrammar(_ N: Int, _ K: Int) -> Int {
        return calculate(N - 1, K - 1)
    }

    func calculate(_ row: Int, _ idx: Int) -> Int {
        if row <= 0 { return 0 }
        if idx < 0 { return 0 }

        let prev = calculate(row - 1, idx / 2)
        let val = (prev, idx % 2)
        switch(val) {
        case (0, 0): return 0
        case (0, 1): return 1
        case (1, 0): return 1
        case (1, 1): return 0
        default: return 0
        }
    }
}
