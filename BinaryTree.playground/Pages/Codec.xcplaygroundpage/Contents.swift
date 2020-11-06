// https://leetcode.com/explore/learn/card/data-structure-tree/133/conclusion/995/

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else {
            return "[]"
        }

        let array = treeToArray(root)
        let string = arrayToString(array)
        return string
    }

    func deserialize(_ data: String) -> TreeNode? {
        let array = stringToArray(data)
        let root = arrayToTree(array)
        return root
    }

    func treeToArray(_ root: TreeNode) -> [Int?] {
        var result = [TreeNode?]()
        result.append(root)
        var offset = 0
        var layCount = 1
        var index = 0
        var nextLayCount = 0

        while(true) {
            while(index < layCount && offset+index < result.count) {
                if let node = result[offset+index] {
                    result.append(node.left)
                    result.append(node.right)
                    nextLayCount = nextLayCount + 2
                }
                index = index + 1
            }

            if offset+index >= result.count {
                break
            } else {
                index = 0
                offset = offset + layCount
                layCount = nextLayCount
            }
        }

        // trim the trailing nil
        while(result.last! == nil) {
            result.removeLast()
        }

        return result.map { $0?.val }
    }

    func arrayToString(_ array: [Int?]) -> String {
        var output = String()

        for item in array {
            if item != nil {
                output = output + ",\(String(item!))"
            } else {
                output = output + ",null"
            }
        }

        // remove heading ','
        if output.count > 0 {
            output.removeFirst()
        }

        return "[" + output + "]"
    }

    func stringToArray(_ str: String) -> [Int?] {
        var str = str

        // remove '[' and ']'
        str.removeFirst()
        str.removeLast()

        let arr = str.split(separator: ",")
        return arr.map { $0 == "null" ? nil : Int($0) }
    }

    func arrayToTree(_ array: [Int?]) -> TreeNode? {
        if array.count <= 0 {
            return nil
        }

        let rootVal = array[0]
        let root = TreeNode(rootVal!)

        var offset = 1
        var layCount = 2
        var index = 0
        var prevLayNodes = [root]

        while(true) {
            var currLayNodes = [TreeNode]()
            while(index < layCount && offset+index < array.count) {
                let parent = prevLayNodes[index/2]
                var val = array[offset+index]
                var node = val == nil ? nil : TreeNode(val!)
                if index % 2 == 0 {
                    parent.left = node
                } else {
                    parent.right = node
                }
                if node != nil {
                    currLayNodes.append(node!)
                }
                index = index + 1
            }

            if (offset+index >= array.count) {
                break;
            } else {
                offset = offset + index
                index = 0
                prevLayNodes = currLayNodes
                layCount = currLayNodes.count * 2
            }
        }

        return root
    }
}
