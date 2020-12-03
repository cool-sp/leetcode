//
//  0341.NestedIterator.swift
//  AllProblems
//
//  Created by liuning on 2020/12/2.
//

import Foundation

 class NestedInteger {
    var arr = [NestedInteger]()
    var val: Int? = nil

    init() {}
    init(_ val: Int) { self.val = val }

    public func isInteger() -> Bool {
        if let _ = val { return true }
        else { return false }
    }

    public func getInteger() -> Int {
        if isInteger() { return val! }
        else { return Int.min }
    }

    public func setInteger(value: Int) {
        arr = []
        val = value
    }

    public func add(_ elem: NestedInteger) {
        if isInteger() {
            let org = NestedInteger()
            org.setInteger(value: self.val!)

            self.val = nil
            self.arr.append(org)
            self.arr.append(elem)
        } else {
            arr.append(elem)
        }
    }

    public func getList() -> [NestedInteger] {
        return arr
    }
 }

class NestedIterator {
    var map = [ObjectIdentifier: NestedInteger]()
    var cur: NestedInteger? = nil

    init(_ nestedList: [NestedInteger]) {
        let count = nestedList.count
        var nextNode: NestedInteger? = nil
        for i in stride(from: count-1, to: -1, by: -1) {
            nextNode = build(nestedList[i], nextNode, &map)
        }
        cur = nextNode
    }

    func next() -> Int {
        if hasNext() {
            let ret = cur!.getInteger()
            cur = map[ObjectIdentifier(cur!)]
            return ret
        }
        return Int.min
    }

    func hasNext() -> Bool {
        return cur != nil
    }

    private func build(_ node: NestedInteger, _ next: NestedInteger?, _ map: inout [ObjectIdentifier: NestedInteger]) -> NestedInteger? {
        if node.isInteger() {
            map[ObjectIdentifier(node)] = next
            return node
        } else {
            let list = node.getList()
            let count = list.count
            var nextNode = next
            for i in stride(from: count-1, to: -1, by: -1) {
                nextNode = build(list[i], nextNode, &map)
            }
            return nextNode
        }
    }
}
