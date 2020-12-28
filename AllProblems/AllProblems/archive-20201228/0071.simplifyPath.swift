//
//  0071.simplifyPath.swift
//  AllProblems
//
//  Created by liuning on 2020/12/10.
//

import Foundation

func simplifyPath(_ path: String) -> String {
    let components = path.split(separator: "/")

    var dirPath = ["/"]
    for component in components {
        dirPath.append(String(component))
    }

    var lastComponent = 0
    for (idx, val) in dirPath.enumerated() {
        if idx == 0 { continue } // skip, it's "/"
        switch val {
        case "..":
            lastComponent -= 1
            if lastComponent < 0 {
                lastComponent = 0
            }
        case ".":
            break // no-op
        default:
            lastComponent += 1
            dirPath[lastComponent] = val
        }
    }

    var res = ""
    for idx in 0...lastComponent {
        res += dirPath[idx]
        if idx > 0 && idx < lastComponent {
            res += "/"
        }
    }
    return res
}
