//  https://leetcode.com/explore/learn/card/fun-with-arrays/526/deleting-items-from-an-array/3247/

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var posDel = findFirstDeleted(nums, 0, val)
        if posDel < 0 {
            return nums.count
        }

        var posNotDel = findFirstNotDeleted(nums, posDel + 1, val)
        if posNotDel < 0 {
            return posDel
        }

        while(posNotDel < nums.count) {
            if nums[posNotDel] != val {
                nums[posDel] = nums[posNotDel]
                posDel = posDel + 1
            }
            posNotDel = posNotDel + 1
        }

        return posDel
    }

    func findFirstDeleted(_ nums: [Int], _ start: Int, _ val: Int) -> Int {
        var startPos = start
        while(startPos < nums.count) {
            if nums[startPos] == val {
                return startPos
            }
            startPos = startPos + 1
        }
        return -1
    }

    func findFirstNotDeleted(_ nums: [Int], _ start: Int, _ val: Int) -> Int {
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
