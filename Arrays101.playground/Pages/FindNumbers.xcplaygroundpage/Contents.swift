// https://leetcode.com/explore/learn/card/fun-with-arrays/521/introduction/3237/

class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        var count = 0
        for num in nums {
            if isEven(num) {
                count = count + 1
            }
        }
        return count
    }

    func isEven(_ num: Int) -> Bool {
        switch(num) {
        case 1...9: return false
        case 10...99: return true
        case 100...999: return false
        case 1000...9999: return true
        case 10000...99999: return false
        case 100000...999999: return true
        default: return false
        }
    }
}
