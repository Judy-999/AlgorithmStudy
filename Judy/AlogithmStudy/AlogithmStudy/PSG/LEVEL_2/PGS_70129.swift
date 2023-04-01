//
//  PGS_70129.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/01.
//  https://school.programmers.co.kr/learn/courses/30/lessons/70129

import Foundation

func answer_PGS_이진변환반복하기(_ s:String) -> [Int] {
    var number = s
    var count = 0, zero = 0
    
    while number != "1" {
        let numberCount = number.count
        number = number.filter { String($0) != "0" }
        zero += numberCount - number.count
        number = String(number.count, radix: 2)
        count += 1
    }
    
    return [count, zero]
}
