// https://leetcode.com/explore/learn/card/fun-with-arrays/525/inserting-items-into-an-array/3253/

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var pos1 = m - 1
        var pos2 = n - 1
        var posResult = nums1.count - 1

        while(pos1 >= 0 && pos2 >= 0) {
            if nums1[pos1] > nums2[pos2] {
                nums1[posResult] = nums1[pos1]
                pos1 = pos1 - 1
            } else {
                nums1[posResult] = nums2[pos2]
                pos2 = pos2 - 1
            }
            posResult = posResult - 1
        }

        while (pos2 >= 0) {
            nums1[posResult] = nums2[pos2]
            pos2 = pos2 - 1
            posResult = posResult - 1
        }
    }
}
