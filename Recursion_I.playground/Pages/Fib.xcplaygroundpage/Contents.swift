// https://leetcode.com/explore/learn/card/recursion-i/255/recursion-memoization/1661/

class Solution {
    func fib(_ N: Int) -> Int {
        guard N >= 0 else { return 0 }

        var cache = [Int: Int]()
        cache[0] = 0
        cache[1] = 1
        return calculate(N, &cache)
    }

    func calculate(_ N: Int, _ cache: inout [Int: Int]) -> Int {
        if let result = cache[N] {
            return result
        }

        let prev2 = calculate(N-2, &cache)
        let prev1 = calculate(N-1, &cache)
        let result = prev2 + prev1
        cache[N] = result
        return result
    }
}
