// https://leetcode.com/explore/learn/card/fun-with-arrays/523/conclusion/3231/

class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var min = Int.min
        var mid = Int.min
        var max = Int.min

        for num in nums {
            update(&min, &mid, &max, num)
        }

        if min != Int.min {
            return min
        } else {
            return max
        }
    }

    func update(_ min: inout Int, _ mid: inout Int, _ max: inout Int, _ val: Int) {
        if val < min {
            return
        } else if val > min && val < mid {
            min = val
        } else if val > mid && val < max {
            min = mid
            mid = val
        } else if val > max {
            min = mid
            mid = max
            max = val
        }
    }
}
