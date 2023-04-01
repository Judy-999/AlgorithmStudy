//
//  PGS_12945.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/01.
//  https://school.programmers.co.kr/learn/courses/30/lessons/12945

import Foundation

// DP
func answer_PGS_피보나치수(_ n:Int) -> Int {
    return fibo(n) % 1234567
}

func fibo(_ n: Int) -> Int {
    var cache = [0, 1]
    
    guard n > 1 else { return n }

    for i in 2...n {
        cache.append((cache[i - 1] + cache[i - 2]) % 1234567)
    }
    
    return cache[n]
}
