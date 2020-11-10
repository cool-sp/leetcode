// https://leetcode.com/explore/learn/card/recursion-ii/507/beyond-recursion/2901/

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let count = heights.count
        if count <= 0 { return 0 }
        if count == 1 { return heights[0] }

        var leftAndRight = Array<(Int, Int)>(repeating: (-1, count), count: count)
        var stack = [Int]()
        stack.append(0)
        for index in 1..<count {
            if heights[index-1] == heights[index] {
                leftAndRight[index].0 = leftAndRight[index-1].0
            } else if heights[index-1] < heights[index] {
                leftAndRight[index].0 = index-1
            } else if heights[index-1] > heights[index] {
                while(!stack.isEmpty) {
                    let last = stack.last!
                    if heights[last] > heights[index] {
                        leftAndRight[last].1 = index
                        stack.removeLast()
                    } else {
                        break
                    }
                }
                if !stack.isEmpty {
                    leftAndRight[index].0 = stack.last!
                }
            }

            stack.append(index)
        }

        var max = area(leftAndRight[0], heights[0])
        for index in 1..<count {
            let val = area(leftAndRight[index], heights[index])
            if val > max {
                max = val
            }
        }
        return max
    }

    func area(_ leftAndRight: (Int, Int), _ height: Int) -> Int {
        return (leftAndRight.1 - leftAndRight.0 - 1) * height
    }
}
