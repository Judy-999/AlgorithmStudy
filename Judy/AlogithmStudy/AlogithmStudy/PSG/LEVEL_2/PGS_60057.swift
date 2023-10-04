//
//  PGS_60057.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/12.
//  https://school.programmers.co.kr/learn/courses/30/lessons/60057

import Foundation

func answer_PGS_문자열압축(_ s:String) -> Int {
    if s.count == 1 { return 1}
    
    let max = s.count / 2
    let counts = (1...max).map { compression(s, $0) }

    return min(s.count, counts.min()!)
}

func compression(_ s: String, _ unit: Int) -> Int {
    var stack = [String]()
    var words = ""
    var count = 0
    
    for (index, alphavet) in s.enumerated() {
        if index % unit == 0 && index != 0 { // 압축할 개수이면
            if stack.last == words { // 이미 똑같은걸 압축한 상태라면
                count += 1
            } else {
                if count > 1 { stack.append("\(count)") } // 이미 압축한게 있었으면 숫자도 추가
                stack.append(words)
                count = 1
            }
            words.removeAll() // 다시 새롭게 압축 시작
        }
    
        words += String(alphavet)
    }
    
    stack.last == words ? count += 1 : stack.append(words)
    if count > 1 { stack.append("\(count)") } // 마지막 문자열 추가
   
    return stack.joined().count
}

//처음 풀이 코드
//func solution(_ s:String) -> Int {
//    if s.count == 1 { return 1}
//
//    let max = s.count / 2
//    let counts = (1...max).map { compression(s, $0) }
//
//    return min(s.count, counts.min()!)
//}
//
//func compression(_ s: String, _ unit: Int) -> Int {
//    var stack = [String]()
//    var words = ""
//
//    for (i, c) in s.enumerated() {
//        if i % unit == 0 && i != 0 {
//            stack.append(words)
//            words.removeAll()
//        }
//
//        words += String(c)
//    }
//    stack.append(words)
//
//    var compressions = [String]()
//    var count = 0
//
//    for word in stack {
//        if compressions.last == word {
//            count += 1
//            continue
//        }
//
//        if count > 1 { compressions.append("\(count)") }
//        compressions.append(word)
//        count = 1
//    }
//    if count > 1 { compressions.append("\(count)") }
//
//    return compressions.joined().count
//}
