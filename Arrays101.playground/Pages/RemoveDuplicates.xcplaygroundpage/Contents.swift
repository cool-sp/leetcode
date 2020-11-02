// https://leetcode.com/explore/learn/card/fun-with-arrays/526/deleting-items-from-an-array/3248/
// https://leetcode.com/explore/learn/card/fun-with-arrays/511/in-place-operations/3258/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 0 {
            return 0
        }

        var val = nums[0]
        var to = 1
        var from = findFirstNot(nums, 1, val)
        while(from >= 0) {
            nums[to] = nums[from]
            to = to + 1
            val = nums[from]
            from = findFirstNot(nums, from + 1, val)
        }

        return to
    }

    func findFirstNot(_ nums: [Int], _ start: Int, _ val: Int) -> Int {
        var startPos = start
        while(startPos < nums.count) {
            if nums[startPos] != val {
                return startPos
            }
            startPos = startPos + 1
        }
        return -1
    }
}
