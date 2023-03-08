//
//  PGS_12909.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/08.
//  https://school.programmers.co.kr/learn/courses/30/lessons/12909

import Foundation

func answer_PGS_올바른괄호(_ s: String) -> Bool {
    var stack = [String]()

    for bracket in s {
        if bracket == "(" {
            stack.append("(")
            continue
        }

        if stack.popLast() != "(" {
            return false
        }
    }

    return stack.isEmpty
}
