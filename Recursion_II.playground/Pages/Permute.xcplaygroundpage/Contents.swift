// https://leetcode.com/explore/learn/card/recursion-ii/507/beyond-recursion/2903/

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.count <= 0 { return [] }
        return calculate([[Int]](), Set<Int>(nums))
    }

    func calculate(_ results: [[Int]], _ remainings: Set<Int>) -> [[Int]] {
        if remainings.count <= 0 { return results }

        var output = [[Int]]()
        for e in remainings {
            var newResult = [[Int]]()
            var newRemaining = remainings
            newRemaining.remove(e)
            if results.isEmpty {
                newResult.append([e])
            } else {
                for r in results {
                    var copy = r
                    copy.append(e)
                    newResult.append(copy)
                }
            }
            output = output + calculate(newResult, newRemaining)
        }

        return output
    }
}
