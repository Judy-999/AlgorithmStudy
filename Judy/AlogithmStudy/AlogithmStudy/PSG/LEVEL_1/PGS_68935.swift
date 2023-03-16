//
//  PGS_68935.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/16.
//  https://school.programmers.co.kr/learn/courses/30/lessons/68935

import Foundation

func answer_PGS_3진법뒤집기(_ n: Int) -> Int {
    var result = [Int]()
    var number = n
    var sum = 0
    
    while number > 0 {
        result.append(number % 3)
        number = number / 3
    }
    
    for (index, num) in result.reversed().enumerated() {
        sum += num * Int(pow(3, Double(index)))
    }
        
    return sum
}


func answer_PGS_3진법뒤집기_다른사람풀이(_ n:Int) -> Int {
    let flipToThree = String(n, radix: 3)
    let answer = Int(String(flipToThree.reversed()), radix:3)!
    return answer
}
