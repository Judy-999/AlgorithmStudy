//
//  PGS_12949.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/06.
//  https://school.programmers.co.kr/learn/courses/30/lessons/12949

import Foundation

func answer_PGS_행렬의곱셉(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = [[Int]]()
    
    for r in 0..<arr1.count {
        var sum = [Int]()
        for c in 0..<arr2[0].count {
            var s = 0
            for i in 0..<arr1[0].count {
                 s += arr1[r][i] * arr2[i][c]
             }
             sum.append(s)
        }
        
        result.append(sum)
    }
    

    return result
}
