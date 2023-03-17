//
//  PGS_42578.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/17.
//  https://school.programmers.co.kr/learn/courses/30/lessons/42578


import Foundation

func answer_PGS_위장(_ clothes:[[String]]) -> Int {
    var dics = [String: Int]()

    clothes.forEach { cloth in
        dics[cloth[1]] = (dics[cloth[1]] ?? 0) + 1
    }

    return dics.map { $0.value + 1}.reduce(1, *) - 1
}
