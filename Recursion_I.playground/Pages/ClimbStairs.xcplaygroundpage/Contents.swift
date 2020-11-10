// https://leetcode.com/explore/learn/card/recursion-i/255/recursion-memoization/1662/

class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 0 else { return 0 }

        var cache = [Int: Int]()
        cache[1] = 1
        cache[2] = 2
        return calculate(n, &cache)
    }

    func calculate(_ n: Int, _ cache: inout [Int: Int]) -> Int {
        if let result = cache[n] {
            return result
        }

        let prev1 = calculate(n - 1, &cache)
        let prev2 = calculate(n - 2, &cache)
        let result = prev1 + prev2
        cache[n] = result
        return result
    }
}
