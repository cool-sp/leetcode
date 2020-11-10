// https://leetcode.com/explore/learn/card/recursion-ii/470/divide-and-conquer/2944/

class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 {
            return nums
        }
        
        let mid = nums.count / 2
        var left = mid > 0 ? Array(nums[0..<mid]) : []
        var right = Array(nums[mid..<nums.count])
        left = sortArray(left)
        right = sortArray(right)

        return merge(left, right)
    }

    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var lidx = 0
        var ridx = 0
        var result = [Int]()

        while(lidx < left.count && ridx < right.count) {
            if left[lidx] < right[ridx] {
                result.append(left[lidx])
                lidx = lidx + 1
            } else {
                result.append(right[ridx])
                ridx = ridx + 1
            }
        }

        while(lidx < left.count) {
            result.append(left[lidx])
            lidx = lidx + 1
        }

        while(ridx < right.count) {
            result.append(right[ridx])
            ridx = ridx + 1
        }

        return result
    }
}
