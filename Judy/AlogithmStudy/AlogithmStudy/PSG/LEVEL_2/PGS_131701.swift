//
//  PGS_131701.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/28.
//  https://school.programmers.co.kr/learn/courses/30/lessons/131701

import Foundation

func answer_PGS_연속부분수열합의개수(_ elements:[Int]) -> Int {
    var result = Set<Int>()
    let list = elements + elements
    
    for i in 0..<elements.count {
        var sum = 0
        for j in 0..<elements.count {
            sum += list[i + j]
            result.insert(sum)
        }
    }
    
    return result.count
}
