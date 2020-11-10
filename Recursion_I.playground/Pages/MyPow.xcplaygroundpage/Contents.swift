// https://leetcode.com/explore/learn/card/recursion-i/256/complexity-analysis/2380/

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }

        var x = x
        var n = n

        if n < 0 {
            n = -n
            x = 1 / x
        }

        return n % 2 == 0 ? myPow(x * x, n / 2) : x * myPow(x * x, n / 2)
    }
}
