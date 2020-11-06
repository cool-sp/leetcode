// https://leetcode.com/explore/learn/card/linked-list/209/singly-linked-list/1290/
// https://leetcode.com/explore/learn/card/linked-list/210/doubly-linked-list/1294/

class MyLinkedList {
    var head: MyLinkedListNode
    var tail: MyLinkedListNode?

    /** Initialize your data structure here. */
    init() {
        self.head = MyLinkedListNode(0, true)
        self.tail = nil
    }

    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        if let node = getNode(index) {
            return node.value
        }
        return -1
    }

    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let newNode = MyLinkedListNode(val)

        if let node = getNode(0) {
            node.appendBeforeSelf(newNode)
        } else {
            head.appendAfterSelf(newNode)
            tail = newNode
        }
    }

    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        let newNode = MyLinkedListNode(val)

        if let node = tail {
            node.appendAfterSelf(newNode)
        } else {
            head.appendAfterSelf(newNode)
        }
        tail = newNode
    }

    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        let newNode = MyLinkedListNode(val)
        if let node = getNode(index - 1) {
            node.appendAfterSelf(newNode)
            if tail === node {
                tail = newNode
            }
        }
    }

    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if let node = getNode(index) {
            let prevNode = node.prev!
            prevNode.removeAfterSelf()
            if tail === node {
                tail = prevNode
            }
        }
    }

    private func getNode(_ index: Int) -> MyLinkedListNode? {
        var count = index
        var node = head
        while(count >= 0 && node.next != nil) {
            node = node.next!
            count = count - 1
        }

        if (count < 0) {
            return node
        } else {
            return nil
        }
    }
}

class MyLinkedListNode {
    let isHead: Bool
    let value: Int
    var prev: MyLinkedListNode?
    var next: MyLinkedListNode?

    init(_ value: Int, _ isHead: Bool = false) {
        self.isHead = isHead
        self.value = value
        self.prev = nil
        self.next = nil
    }

    func appendAfterSelf(_ node: MyLinkedListNode?) {
        if let node = node {
            let oldNext = self.next
            let newNext = node

            self.next = newNext
            newNext.next = oldNext
            oldNext?.prev = newNext
            newNext.prev = self
        } else {
            self.next = nil
        }
    }

    func appendBeforeSelf(_ node: MyLinkedListNode?) {
        if let node = node {
            let newPrev = node
            let oldPrev = self.prev

            oldPrev?.next = newPrev
            newPrev.next = self
            self.prev = newPrev
            newPrev.prev = oldPrev
        } else {
            self.prev = nil
        }
    }

    func removeAfterSelf() {
        if let node = next {
            node.next?.prev = self
            self.next = node.next
        }
    }

    func removeBeforeSelf() {
        if let node = prev, !node.isHead {
            node.prev?.next = self
            self.prev = node.prev
        }
    }
}
