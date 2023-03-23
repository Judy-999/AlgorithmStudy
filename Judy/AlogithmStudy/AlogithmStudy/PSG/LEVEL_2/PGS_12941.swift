//
//  PGS_12941.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/23.
//  https://school.programmers.co.kr/learn/courses/30/lessons/12941

import Foundation

func answer_PGS_최솟값만들기(_ A: [Int], _ B: [Int]) -> Int{
    let aList = A.sorted(by: >)
    let bList = B.sorted(by: <)
    var sum = 0
    
    for (a, b) in zip(aList, bList) {
        sum += a * b
    }

    return sum
}
