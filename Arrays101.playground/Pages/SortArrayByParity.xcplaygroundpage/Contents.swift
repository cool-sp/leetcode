// https://leetcode.com/explore/learn/card/fun-with-arrays/511/in-place-operations/3260/

class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var copy = A
        var leftPos = findFirstOddFromLeft(copy, 0)
        var rightPos = findFirstEvenFromRight(copy, copy.count - 1)

        if (leftPos < 0 || rightPos < 0) {
            return copy
        }

        while (leftPos < rightPos) {
            swap(&copy, leftPos, rightPos)
            leftPos = findFirstOddFromLeft(copy, leftPos + 1)
            rightPos = findFirstEvenFromRight(copy, rightPos - 1)

            if (leftPos < 0 || rightPos < 0) {
                break
            }
        }

        return copy
    }

    func findFirstOddFromLeft(_ A: [Int], _ left: Int) -> Int {
        for index in left..<A.count {
            if isOdd(A[index]) {
                return index
            }
        }
        return -1
    }

    func findFirstEvenFromRight(_ A: [Int], _ right: Int) -> Int {
        var index = right
        while(index >= 0) {
            if isEven(A[index]) {
                return index
            }

            index = index - 1
        }
        return -1
    }

    func isEven(_ val: Int) -> Bool {
        return val % 2 == 0
    }

    func isOdd(_ val: Int) -> Bool {
        return !isEven(val)
    }

    func swap(_ A: inout [Int], _ left: Int, _ right: Int) {
        var temp = A[left]
        A[left] = A[right]
        A[right] = temp
    }
}
