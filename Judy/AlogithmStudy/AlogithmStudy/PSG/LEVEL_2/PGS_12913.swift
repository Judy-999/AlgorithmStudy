//
//  PGS_12913.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/31.
//  https://school.programmers.co.kr/learn/courses/30/lessons/12913

import Foundation

// 질문지 보고 푼 문제
// dp 활용
func answer_PGS_땅따먹기(_ land:[[Int]]) -> Int{
    var result = land
    
    for i in 0..<(land.count-1) {
        result[i+1][0] += max(result[i][1], result[i][2], result[i][3])
        result[i+1][1] += max(result[i][0], result[i][2], result[i][3])
        result[i+1][2] += max(result[i][0], result[i][1], result[i][3])
        result[i+1][3] += max(result[i][0], result[i][1], result[i][2])
    }
    
    return result.last!.max()!
}

