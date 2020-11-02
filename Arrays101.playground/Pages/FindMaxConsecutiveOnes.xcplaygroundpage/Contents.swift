// https://leetcode.com/explore/learn/card/fun-with-arrays/521/introduction/3238/

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxCount = 0
        var count = 0
        for num in nums {
            if num != 1 {
                count = 0
            } else {
                count = count + 1
                if count > maxCount {
                    maxCount = count
                }
            }
        }

        return maxCount;
    }
}
