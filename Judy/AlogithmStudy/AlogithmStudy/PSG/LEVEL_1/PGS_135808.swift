//
//  PGS_135808.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/08.
//  https://school.programmers.co.kr/learn/courses/30/lessons/135808

import Foundation

func answer_PGS_과일장수(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    let sortedScore = score.sorted(by: >)
    var i = 0
    var sum = 0
    
    while i + m <= score.count  {
        sum += sortedScore[i + m - 1] * m
        i += m
    }
      
    return sum
}
