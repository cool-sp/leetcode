// https://leetcode.com/explore/learn/card/fun-with-arrays/527/searching-for-items-in-an-array/3250/

class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        if arr.count <= 1 {
            return false
        }

        var countOfZero = 0
        var doubleSet = Set<Int>()
        for item in arr {
            if item == 0 {
                // special case
                // to handle if we have multiple zeros
                countOfZero = countOfZero + 1
            } else {
                doubleSet.insert(item * 2)
            }
        }

        if countOfZero >= 2 {
            return true
        }

        for item in arr {
            if doubleSet.contains(item) {
                return true
            }
        }

        return false
    }
}
