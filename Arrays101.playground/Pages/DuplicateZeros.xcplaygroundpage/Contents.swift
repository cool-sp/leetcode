// https://leetcode.com/explore/learn/card/fun-with-arrays/525/inserting-items-into-an-array/3245/

class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        if arr.count <= 0 {
            return
        }
        let length = arr.count

        var (cutted, zeroTailing) = findCuttedCount(arr)
        var aPos = length - 1 - cutted
        var bPos = length - 1
        while(aPos >= 0) {
            if zeroTailing || arr[aPos] != 0 {
                arr[bPos] = arr[aPos]
                zeroTailing = false
                aPos = aPos - 1
                bPos = bPos - 1
            } else {
                arr[bPos] = arr[aPos]
                arr[bPos - 1] = arr[aPos]
                aPos = aPos - 1
                bPos = bPos - 2
            }
        }
    }

    func findCuttedCount(_ array: [Int]) -> (Int, Bool) {
        var cutted = 0
        var idx = 0
        while (idx < array.count - cutted) {
            if array[idx] == 0 {
                cutted = cutted + 1
            }
            idx = idx + 1
        }
        if cutted + idx > array.count {
            // special case:
            // [1,0,2,3,0,0,0,0] -> [1,0,0,2,3,0,0,0]
            // pay attenditon to the 3rd zero
            return (cutted - 1, true)
        } else {
            return (cutted, false)
        }
    }
}
