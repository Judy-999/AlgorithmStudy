//
//  PGS_72410.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/20.
//  https://school.programmers.co.kr/learn/courses/30/lessons/72410

import Foundation

func answer_PGS_신규아이디추천(_ new_id:String) -> String {
    let special: [Character] = [".", "-", "_"]
    var id = new_id.lowercased().filter { special.contains($0) || $0.isLetter || $0.isNumber }

    while id.contains("..") {
        id = id.replacingOccurrences(of: "..", with: ".")
    }
    
    var newID = id.map { String($0) }
    if newID.first == "." { newID.remove(at: 0) }
    if newID.isEmpty { newID.append("a") }
    if newID.count >= 16 { newID = Array(newID[0...14]) }
    if newID.last == "." { newID.removeLast() }
    if newID.count <= 2 { newID += Array(repeating: newID.last!, count: 3 - newID.count) }
    
    return newID.reduce("", +)
}

// isLetter, isNumber 이전 버전
//func answer_PGS_신규아이디추천(_ new_id:String) -> String {
//    let id = new_id.lowercased()
//    let special: [Character] = [".", "-", "_"]
//    let numbers = "0123456789".map { $0 }
//    let alphavet = "abcdefghijklmnopqrstuvwxyz".map { $0 }
//    let rule = special + numbers + alphavet
//    var newID = id.filter { rule.contains($0) }.map { String($0) }
//    var pre: [String] = []
//
//    for c in newID {
//        if let last = pre.last, c == last, last == "." { continue }
//        pre.append(c)
//    }
//    newID = pre
//
//    if newID.first == "." { newID.remove(at: 0) }
//    if newID.isEmpty { newID.append("a") }
//    if newID.count >= 16 { newID = Array(newID[0...14]) }
//    if newID.last == "." { newID.removeLast() }
//    if newID.count <= 2 { newID += Array(repeating: newID.last!, count: 3 - newID.count) }
//
//    return newID.reduce("", +)
//}
