// https://leetcode.com/explore/learn/card/recursion-ii/503/recursion-to-iteration/2772/

class Solution {
    struct State {
        let str: String
        let balance: Int
        let count: Int

        init(_ str: String, _ balance: Int, _ count: Int) {
            self.str = str
            self.balance = balance
            self.count = count
        }
    }

    func generateParenthesis(_ n: Int) -> [String] {
        var queue = [State]()
        var result = [String]()

        queue.append(State("(", 1, 1))
        while(queue.count > 0) {
            let state = queue.removeFirst()

            if state.count == n && state.balance == 0 {
                result.append(state.str)
            } else {
                if state.balance == 0 {
                    queue.append(State(state.str+"(", 1, state.count+1))
                } else {
                    if state.count <= n-1 {
                        queue.append(State(state.str+"(", state.balance+1, state.count+1))
                    }
                    queue.append(State(state.str+")", state.balance-1, state.count))
                }
            }
        }

        return result
    }
}

