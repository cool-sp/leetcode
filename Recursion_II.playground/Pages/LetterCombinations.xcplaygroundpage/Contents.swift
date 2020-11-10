// https://leetcode.com/explore/learn/card/recursion-ii/507/beyond-recursion/2905/

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count <= 0 { return [] }

        var result = [String]()
        for d in digits {
            result = join(result, getMappedKeys(d))
        }

        return result
    }

    func getMappedKeys(_ str: Character) -> [String] {
        switch(str) {
        case "2": return ["a", "b", "c"]
        case "3": return ["d", "e", "f"]
        case "4": return ["g", "h", "i"]
        case "5": return ["j", "k", "l"]
        case "6": return ["m", "n", "o"]
        case "7": return ["p", "q", "r", "s"]
        case "8": return ["t", "u", "v"]
        case "9": return ["w", "x", "y", "z"]
        default: return []
        }
    }

    func join(_ arrayA: [String], _ arrayB: [String]) -> [String] {
        if arrayA.count <= 0 { return arrayB }
        if arrayB.count <= 0 { return arrayA }

        var result = [String]()
        for a in arrayA {
            for b in arrayB {
                result.append(a+b)
            }
        }

        return result
    }
}

