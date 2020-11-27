//
//  0207.canFinish.swift
//  AllProblems
//
//  Created by liuning on 2020/11/26.
//

import Foundation

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    if numCourses <= 0 { return true }
    if prerequisites.count <= 0 { return true }

    var courseArr = Array(repeating: 0, count: numCourses+1)
    var courseMap = [Int: [Int]]()

    for preReq in prerequisites {
        let from = preReq[0]
        let to = preReq[1]

        courseArr[to] += 1
        courseMap[from, default:[]].append(to)
    }

    var availableCourse = courseMap.keys.filter { courseArr[$0] == 0 }
    while(!availableCourse.isEmpty) {
        for fromCourse in availableCourse {
            for toCourse in courseMap[fromCourse]! {
                courseArr[toCourse] -= 1
            }
            courseMap[fromCourse] = nil
        }

        availableCourse = courseMap.keys.filter { courseArr[$0] == 0 }
    }

    return !courseMap.keys.contains {courseArr[$0] >= 1}
}
