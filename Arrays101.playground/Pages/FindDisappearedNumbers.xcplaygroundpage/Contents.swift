// https://leetcode.com/explore/learn/card/fun-with-arrays/523/conclusion/3270/

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var copy = nums
        var index = 0
        while(index < copy.count) {
            if (copy[index] != 0) {
                var pos = copy[index]
                while(pos != 0) {
                    var temp = copy[pos-1]
                    copy[pos-1] = 0
                    pos = temp
                }
            }
            index = index + 1
        }

        var ret = [Int]()
        for index in 0..<copy.count {
            if copy[index] != 0 {
                ret.append(index + 1)
            }
        }

        return ret
    }
}
