class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        let rowMax = board.count
        assert(rowMax == 9)
        let columnMax = board[0].count
        assert(columnMax == 9)

        solve(&board)
    }

    func solve(_ board: inout [[Character]]) -> Bool {
        if let (row, column) = findFirstHole(board) {
            let allPossibleValues = findPossibleValues(board, row, column)
            if allPossibleValues.isEmpty {
                return false
            }
            for value in allPossibleValues {
                board[row][column] = value
                if !solve(&board) {
                    board[row][column] = "."
                } else {
                    return true
                }
            }
        } else {
            return true
        }
        return false

    }

    func findFirstHole(_ board: [[Character]]) -> (Int, Int)? {
        let rowMax = board.count
        let columnMax = board[0].count

        for r in 0..<rowMax {
            for c in 0..<columnMax {
                if board[r][c] == "." {
                    return (r, c)
                }
            }
        }
        return nil
    }

    func findPossibleValues(_ board: [[Character]], _ row: Int, _ column: Int) -> Set<Character> {
        var rowSet = Set<Character>()
        for e in board[row] {
            if e != "." {
                rowSet.insert(e)
            }
        }

        var columnSet = Set<Character>()
        for r in 0..<board.count {
            let e = board[r][column]
            if e != "." {
                columnSet.insert(e)
            }
        }

        var blockSet = Set<Character>()
        let rs = startIndex(row)
        let cs = startIndex(column)
        for r in rs..<rs+3 {
            for c in cs..<cs+3 {
                let e = board[r][c]
                if e != "." {
                    blockSet.insert(e)
                }
            }
        }

        var result = Set<Character>()
        for e in 1...9 {
            result.insert(Character(String(e)))
        }

        result = result.subtracting(rowSet).subtracting(columnSet).subtracting(blockSet)
        return result
    }

    func startIndex(_ idx: Int) -> Int {
        switch(idx) {
        case 0...2: return 0
        case 3...5: return 3
        case 6...8: return 6
        default: return 0
        }
    }
}
