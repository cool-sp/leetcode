// https://leetcode.com/explore/learn/card/fun-with-arrays/511/in-place-operations/3259/

class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        if arr.count <= 0 {
            return arr
        }

        var copy = arr
        var length = arr.count
        var max = -1

        for idx in 0..<length {
            var temp = copy[length-1-idx]
            copy[length-1-idx] = max

            if (temp > max) {
                max = temp
            }
        }

        return copy
    }
}
