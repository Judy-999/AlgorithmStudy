//
//  PGS_12911.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/01.
//  https://school.programmers.co.kr/learn/courses/30/lessons/12911

import Foundation

func answer_PGS_다음큰숫자(_ n: Int) -> Int {
    var next = n + 1
    let nBinary = String(n, radix: 2).filter { String($0) == "1" }.count
    
    while true {
        let nextBinary = String(next, radix: 2).filter { String($0) == "1" }.count
        
        if nextBinary == nBinary {
            break
        }
        
        next += 1
    }
    
    return next
}

// nonzeroBitCount == 0이 아닌 비트 개수
//func solution(_ n: Int) -> Int {
//    var next = n + 1
//
//    while true {
//        if n.nonzeroBitCount == next.nonzeroBitCount { break }
//
//        next += 1
//    }
//
//    return next
//}
