//
//  0284.PeekingIterator.swift
//  AllProblems
//
//  Created by liuning on 2021/1/3.
//

import Foundation

class PeekingIterator {
    var arr: IndexingIterator<Array<Int>>
    var nextVal: Int?

    init(_ arr: IndexingIterator<Array<Int>>) {
        self.arr = arr
        nextVal = self.arr.next()
    }

    func next() -> Int {
        let res = nextVal
        nextVal = arr.next()
        return res!
    }

    func peek() -> Int {
        return nextVal!
    }

    func hasNext() -> Bool {
        return nextVal != nil
    }
}
