// https://leetcode.com/explore/learn/card/fun-with-arrays/521/introduction/3240/
// https://leetcode.com/explore/learn/card/fun-with-arrays/511/in-place-operations/3261/

class Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        var output = [Int](repeating: 0, count: A.count)
        let firstNonNegativeIdx = findFirstNonNegative(A)

        var oIdx = 0
        var leftIdx = firstNonNegativeIdx - 1
        var rightIdx = firstNonNegativeIdx

        while(true) {
            if leftIdx < 0 && rightIdx >= A.count {
                return output
            }

            if leftIdx < 0 {
                for rIdx in rightIdx..<A.count {
                    output[oIdx] = square(A[rIdx])
                    oIdx = oIdx + 1
                }
                return output
            }

            if rightIdx >= A.count {
                for lIdx in 0...leftIdx {
                    output[oIdx] = square(A[leftIdx-lIdx])
                    oIdx = oIdx + 1
                }
                return output
            }

            if (abs(A[leftIdx]) > A[rightIdx]) {
                output[oIdx] = square(A[rightIdx])
                rightIdx = rightIdx + 1
            } else {
                output[oIdx] = square(A[leftIdx])
                leftIdx = leftIdx - 1
            }
            oIdx = oIdx + 1
        }
    }

    func findFirstNonNegative(_ A: [Int]) -> Int {
        for idx in 0..<A.count {
            if A[idx] >= 0 {
                return idx
            }
        }
        return A.count
    }

    func square(_ num: Int) -> Int {
        return num * num
    }
}
