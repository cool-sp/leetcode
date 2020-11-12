// https://leetcode.com/explore/learn/card/recursion-ii/470/divide-and-conquer/2872/

class Solution {
    var matrix: [[Int]] = []
    var maxRow = 0
    var maxColumn = 0
    var target = 0

    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        maxRow = matrix.count
        guard maxRow > 0 else { return false }
        maxColumn = matrix[0].count
        guard maxColumn > 0 else { return false }

        self.matrix = matrix
        self.target = target

        return search(0, 0, maxRow - 1, maxColumn - 1)
    }

    func search(_ r1: Int, _ c1: Int, _ r2: Int, _ c2: Int) -> Bool {
        // r1: row of top left
        // c1: column of top left
        // r2: row of bottom right
        // c2: column of bottom right
        guard r1 <= r2, c1 <= c2 else { return false }
        guard r1 < maxRow, r2 < maxRow else { return false }
        guard c1 < maxColumn, c2 < maxColumn else { return false }


        // top left is the smallest number
        if matrix[r1][c1] == target {
            return true
        } else if matrix[r1][c1] > target {
            return false
        }

        // ... and bottom right is the largest number
        if matrix[r2][c2] == target {
            return true
        } else if matrix[r2][c2] < target {
            return false
        }

        // rm: row of mid point
        // cm: column of mid point
        let rm = (r1 + r2) / 2
        let cm = (c1 + c2) / 2

        // possible only when matrix is 1x2, 2x1, or 2x2
        // we have already check (r1, c1) and (r2, c2)
        // so only check the remaining points
        if r1 == rm && c1 == cm {
            var check1 = false
            var check2 = false
            if r2 > r1 { check1 = matrix[r2][c1] == target }
            if c2 > c1 { check2 = matrix[r1][c2] == target }
            return check1 || check2
        }

        if matrix[rm][cm] == target {
            return true
        } else if matrix[rm][cm] > target {
            return search(r1, c1, rm, cm)
                || search(r1, cm + 1, rm - 1, c2)
                || search(rm + 1, c1, r2, cm - 1)
        } else {
            return search(rm, cm, r2, c2)
                || search(r1, cm + 1, rm - 1, c2)
                || search(rm + 1, c1, r2, cm - 1)
        }
    }
}
