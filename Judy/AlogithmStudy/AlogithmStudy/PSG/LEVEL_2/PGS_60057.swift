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
    
    for (i, c) in s.enumerated() {
        if i % unit == 0 && i != 0 {
            if stack.last == words {
                count += 1
            } else {
                if count > 1 { stack.append("\(count)") }
                stack.append(words)
                count = 1
            }
            words.removeAll()
        }
    
        words += String(c)
    }
    
    stack.last == words ? count += 1 : stack.append(words)
    if count > 1 { stack.append("\(count)") }
   
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
