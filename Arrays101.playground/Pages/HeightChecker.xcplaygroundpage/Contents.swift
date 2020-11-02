// https://leetcode.com/explore/learn/card/fun-with-arrays/523/conclusion/3228/

class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        var copy = heights
        copy.sort()
        
        var count = 0
        var index = 0
        while(index < heights.count) {
            if heights[index] != copy[index] {
                count = count + 1
            }
            index = index + 1
        }

        return count
    }
}
