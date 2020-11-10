// https://leetcode.com/explore/learn/card/recursion-ii/472/backtracking/2798/

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        if n < 1 { return [] }
        if k < 1 { return [] }
        if k > n { return [] }

        var result = [[Int]]()
        calculate(1, n+1, k, &result)
        return result
    }

    func calculate(_ from: Int, _ to: Int, _ k: Int, _ result: inout [[Int]]) {
        if from >= to { return }

        if k == 1 {
            for element in from..<to {
                result.append([element])
            }
        } else {
            var result1 = [[Int]]()
            calculate(from+1, to, k, &result1)
            var result2 = [[Int]]()
            calculate(from+1, to, k-1, &result2)
            for idx in 0..<result2.count {
                result2[idx].append(from)
            }
            result = result1 + result2
        }
    }
}
