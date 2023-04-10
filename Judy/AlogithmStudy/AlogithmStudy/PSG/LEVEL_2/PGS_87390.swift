//
//  PGS_87390.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/10.
//  https://school.programmers.co.kr/learn/courses/30/lessons/87390#

import Foundation

func answer_PGS_n제곱배열자르기(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    return Array(Int(left)...Int(right)).map { i in
        let row = i / n + 1
        let column = i % n + 1
        
        return row >= column ? row : column
    }
}
