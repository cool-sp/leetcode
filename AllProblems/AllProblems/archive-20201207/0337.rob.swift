//
//  0337.rob.swift
//  AllProblems
//
//  Created by liuning on 2020/12/6.
//

import Foundation

func rob(_ root: TreeNode?) -> Int {
    let (sMax, uMax) = travel(root)
    return max(sMax, uMax)
}

private func travel(_ root: TreeNode?) -> (Int, Int) {
    guard let root = root else { return (0, 0) }

    if root.left == nil && root.right == nil {
        return (root.val, 0)
    }

    let (sleft, uleft) = travel(root.left)
    let (sRight, uRight) = travel(root.right)

    let sMax = uleft + uRight + root.val
    let uMax = max(sleft, uleft) + max(sRight, uRight)
    return (sMax, uMax)
}

//func rob(_ root: TreeNode?) -> Int {
//    var srecord = [ObjectIdentifier: Int]()
//    var urecord = [ObjectIdentifier: Int]()
//
//    let selected = robHelper(root, &srecord, &urecord, true)
//    let unselected = robHelper(root, &srecord, &urecord, false)
//
//    return max(selected, unselected)
//}
//
//private func robHelper(_ root: TreeNode?,
//                       _ srecord: inout [ObjectIdentifier: Int], // selected
//                       _ urecord: inout [ObjectIdentifier: Int], // un-selected
//                       _ selected: Bool) -> Int {
//    guard let root = root else { return 0 }
//
//    if root.left == nil && root.right == nil {
//        if selected { return root.val }
//        else { return 0 }
//    }
//
//    if selected && srecord[ObjectIdentifier(root)] != nil {
//        return srecord[ObjectIdentifier(root)]!
//    } else if !selected && urecord[ObjectIdentifier(root)] != nil {
//        return urecord[ObjectIdentifier(root)]!
//    }
//
//    var res = 0
//    if selected {
//        let ulft = robHelper(root.left, &srecord, &urecord, false)
//        let urht = robHelper(root.right, &srecord, &urecord, false)
//
//        res = ulft + urht + root.val
//        srecord[ObjectIdentifier(root)] = res
//    } else {
//        let slft = robHelper(root.left, &srecord, &urecord, true)
//        let ulft = robHelper(root.left, &srecord, &urecord, false)
//        let srht = robHelper(root.right, &srecord, &urecord, true)
//        let urht = robHelper(root.right, &srecord, &urecord, false)
//
//        let maxLft = max(slft, ulft)
//        let maxRht = max(srht, urht)
//        res = maxLft + maxRht
//        urecord[ObjectIdentifier(root)] = res
//    }
//
//    return res
//}
