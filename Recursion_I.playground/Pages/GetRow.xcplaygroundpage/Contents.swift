// https://leetcode.com/explore/learn/card/recursion-i/251/scenario-i-recurrence-relation/3234/

struct PairKey: Hashable {
    let row: Int
    let idx: Int

    init(_ row: Int, _ idx: Int) {
        self.row = row
        self.idx = idx
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.row)
        hasher.combine(self.idx)
    }

    static func ==(lhs: PairKey, rhs: PairKey) -> Bool {
        return lhs.row == rhs.row && lhs.idx == rhs.idx
    }
}

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex >= 0 else { return [] }

        var map = [PairKey: Int]()
        map[PairKey(0, 0)] = 1
        var result = [Int]()
        for nth in 0...rowIndex {
            let val = getElement(rowIndex, nth, &map)
            result.append(val)
        }
        return result
    }

    func getElement(_ rowIndex: Int, _ nth: Int, _ map: inout [PairKey: Int]) -> Int {
        if rowIndex < 0 { return 0 }
        if nth < 0 { return 0 }
        if nth > rowIndex + 1 { return 0 }

        if let result = map[PairKey(rowIndex, nth)] {
            return result
        } else {
            let first = getElement(rowIndex - 1, nth - 1, &map)
            let second = getElement(rowIndex - 1, nth, &map)
            let result = first + second

            map[PairKey(rowIndex, nth)] = result
            return result
        }
    }
}
