//
//  PGS_12914.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/28.
//  https://school.programmers.co.kr/learn/courses/30/lessons/12914

import Foundation

// DP를 활용해 피보나치를 구하는 문제
// 재귀를 쓰면 시간초과
func answer_PGS_멀리뛰기(_ n:Int) -> Int {
    var cache: [Int] = [1, 2]
    
    guard n > 1 else { return n }
    
    for num in 2...n {
        cache.append((cache[num - 2] + cache[num - 1]) % 1234567)
    }
    
    return cache[n-1]
}

// 순열 방식으로 풀어보고자 햤지만 큰 수라 안 되는 듯
//func solution(_ n:Int) -> Int {
//    let max = n / 2
//    var sum = 0
//
//    if n == 1 { return 1 }
//
//    for i in 1...max {
//        sum += toFactory(n - i * 2 + 1, to: n - i) / (factory(i)) % 1234567
//    }
//
//    return (sum+1) % 1234567
//}
//
//func factory(_ n: Int) -> Int {
//    return Array(1...n).reduce(1, *)
//}
