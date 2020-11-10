// https://leetcode.com/explore/learn/card/recursion-ii/472/backtracking/2804/

class Solution {
    struct Coordinate: Hashable {
        let row: Int
        let column: Int

        init(_ row: Int, _ column: Int) {
            self.row = row
            self.column = column
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(row)
            hasher.combine(column)
        }

        static func ==(lhs: Coordinate, rhs: Coordinate) -> Bool {
            return lhs.row == rhs.row && lhs.column == rhs.column
        }
    }

    func totalNQueens(_ n: Int) -> Int {
        var count = 0
        var coordinates = generateCoordinates(n)
        calculate(0, n, &count, &coordinates)
        return count
    }

    func calculate(_ row: Int, _ n: Int, _ count: inout Int, _ coordinates: inout Set<Coordinate>) {
        if row == n {
            count = count + 1
            return
        }

        if coordinates.isEmpty {
            return
        }

        for cord in coordinates.filter({$0.row == row}) {
            let removed = placeQueen(cord.row, cord.column, &coordinates)
            calculate(row+1, n, &count, &coordinates)
            coordinates = coordinates.union(removed)
        }
    }

    func generateCoordinates(_ n: Int) -> Set<Coordinate> {
        var result = Set<Coordinate>()
        for r in 0..<n {
            for c in 0..<n {
                result.insert(Coordinate(r, c))
            }
        }
        return result
    }

    func placeQueen(_ row: Int, _ column: Int, _ coordinates: inout Set<Coordinate>) -> Set<Coordinate> {
        var removed = Set<Coordinate>()
        for cord in coordinates {
            if cord.row == row {
                coordinates.remove(cord)
                removed.insert(cord)
            }
            if cord.column == column {
                coordinates.remove(cord)
                removed.insert(cord)
            }
            if cord.row + cord.column == row + column {
                coordinates.remove(cord)
                removed.insert(cord)
            }
            if cord.row - cord.column == row - column {
                coordinates.remove(cord)
                removed.insert(cord)
            }
        }
        return removed
    }
}
