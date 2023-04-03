//
//  PGS_92335.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/04.
//  https://school.programmers.co.kr/learn/courses/30/lessons/92335

import Foundation

func answer_PGS_k진수에서소수개수구하기(_ n:Int, _ k:Int) -> Int {
    let numbers = String(n, radix: k).components(separatedBy: "0").compactMap { Int($0) }
    
    return numbers.filter{ isPrime($0) }.count
}

func isPrime(_ n: Int) -> Bool {
    guard n > 1 else { return false }
    
    if n == 2 { return true }
    
    for i in 2...(Int(sqrt(Double(n))) + 1) {
        if n % i == 0 {
            return false
        }
    }
    
    return true
}
