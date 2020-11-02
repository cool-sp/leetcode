// https://leetcode.com/explore/learn/card/fun-with-arrays/527/searching-for-items-in-an-array/3251/

class Solution {
    func validMountainArray(_ A: [Int]) -> Bool {
        if A.count < 3 {
            return false
        }

        var idx = 1
        var prev = 0
        var curr = 0
        var trend = Trend.NONE
        var valid = false
        while(idx < A.count) {
            prev = A[idx - 1]
            curr = A[idx]
            (valid, trend) = isValidTrend(prev, curr, trend)
            if !valid {
                return false
            }

            idx = idx + 1
        }
        return trend == Trend.DOWN
    }

    enum Trend {
    case NONE
    case UP
    case DOWN
    }

    func isValidTrend(_ prev: Int, _ curr: Int, _ prevTrend: Trend) -> (Bool, Trend) {
        switch(prevTrend) {
        case .NONE:
            if curr > prev {
                return (true, .UP)
            } else {
                return (false, .NONE)
            }
        case .UP:
            if curr > prev {
                return (true, .UP)
            } else if curr < prev {
                return (true, .DOWN)
            } else {
                return (false, .NONE)
            }
        case .DOWN:
            if curr < prev {
                return (true, .DOWN)
            } else {
                return (false, .NONE)
            }
        }
    }
}
