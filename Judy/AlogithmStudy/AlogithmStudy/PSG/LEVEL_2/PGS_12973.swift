//
//  PGS_12973.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/14.
//  https://school.programmers.co.kr/learn/courses/30/lessons/12973

import Foundation

func answer_PGS_짝지어제거하기(_ s: String) -> Int {
    var list = [Character]()

    for alphavet in s {
        if alphavet == list.last {
            list.removeLast()
            continue
        }

        list.append(alphavet)
    }

    return list.isEmpty ? 1 : 0
}
