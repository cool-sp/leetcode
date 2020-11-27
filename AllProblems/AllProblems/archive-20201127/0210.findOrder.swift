//
//  0210.findOrder.swift
//  AllProblems
//
//  Created by liuning on 2020/11/26.
//

import Foundation

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    if numCourses <= 0 { return [] }
    if prerequisites.count <= 0 { return (0..<numCourses).map {$0} }

    // 0: not visited
    // 1: visiting
    // 2: visited
    var courseState = Array(repeating: 0, count: numCourses)

    // use for storing the path of course
    var courseArray = Array<Int>()
    var courseStack = Array<Int>()

    var courseMap = [Int: [Int]]()
    for preReq in prerequisites {
        let from = preReq[1]
        let to = preReq[0]
        courseMap[from, default:[]].append(to)
    }

    var cycleDetected = false
    var course = courseMap.keys.first(where: {courseState[$0] == 0})
    while(course != nil) {
        courseState[course!] = 1
        courseStack.append(course!)

        while(!courseStack.isEmpty && !cycleDetected) {
            let curr = courseStack.last!
            if let nextCourses = courseMap[curr] {
                var allNextHandled = true
                for nextCourse in nextCourses {
                    if courseState[nextCourse] == 0 {
                        courseState[nextCourse] = 1
                        courseStack.append(nextCourse)
                        allNextHandled = false
                        break
                    } else if courseState[nextCourse] == 1 {
                        allNextHandled = false
                        cycleDetected = true
                        break
                    }
                }

                if allNextHandled {
                    courseState[curr] = 2
                    courseStack.removeLast()
                    courseArray.append(curr)
                }
            } else {
                courseState[curr] = 2
                courseStack.removeLast()
                courseArray.append(curr)
            }
        }

        if cycleDetected { break }
        course = courseMap.keys.first(where: {courseState[$0] == 0})
    }

    if cycleDetected { return [] }

    for (idx, state) in courseState.enumerated() {
        if state == 0 {
            courseArray.append(idx)
        }
    }
    return courseArray.reversed()
}
