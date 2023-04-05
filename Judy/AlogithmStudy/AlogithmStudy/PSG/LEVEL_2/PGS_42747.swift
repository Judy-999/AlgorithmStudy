//
//  PGS_42747.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/05.
//  https://school.programmers.co.kr/learn/courses/30/lessons/42747

import Foundation

func answer_PGS_HIndex(_ citations:[Int]) -> Int {
    var hIndex = 0

    for i in 0...citations.max()! {
        if citations.filter({ $0 >= i }).count >= i {
            hIndex = i
        }
    }
    
    return hIndex
}
