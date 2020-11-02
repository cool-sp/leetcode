// https://leetcode.com/explore/learn/card/fun-with-arrays/511/in-place-operations/3157/

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var aPos = 0
        var bPos = findFirstNotZero(nums, aPos)

        while(bPos >= 0) {
            nums[aPos] = nums[bPos]
            aPos = aPos + 1
            bPos = findFirstNotZero(nums, bPos + 1)
        }

        while (aPos < nums.count) {
            nums[aPos] = 0
            aPos = aPos + 1
        }
    }

    func findFirstNotZero(_ nums: [Int], _ start: Int) -> Int {
        for index in start..<nums.count {
            if nums[index] != 0 {
                return index
            }
        }
        return -1
    }
}
