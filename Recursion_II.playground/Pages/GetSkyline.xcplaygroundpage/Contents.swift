// https://leetcode.com/explore/learn/card/recursion-ii/507/beyond-recursion/3006/

class Solution {
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        if buildings.count <= 0 { return [] }

        var points = [(Int, Int)]()
        for building in buildings {
            let x1 = building[0]
            let x2 = building[1]
            let h = building[2]

            if h > 0 {
                points.append((x1, -h))
                points.append((x2, h))
            }
        }

        points.sort { (p1, p2) -> Bool in
            if p1.0 != p2.0 {
                return p1.0 < p2.0
            } else {
                return p1.1 < p2.1
            }
        }

        var results = [[Int]]()
        var prev = 0
        var heightMap = [Int: Int]() // pair of <height:Count>
        heightMap[0] = 1

        for point in points {
            let x = point.0
            let h = point.1
            var curr = 0

            if h < 0 {
                heightMap[-h, default:0] += 1
                curr = -h > prev ? -h : prev
            } else {
                if let count = heightMap[h] {
                    if count == 1 {
                        heightMap[h] = nil
                    } else {
                        heightMap[h] = count - 1
                    }
                    curr = heightMap.keys.max()!
                }
            }

            if prev != curr {
                results.append([x, curr])
                prev = curr
            }
        }

        return results
    }
}
