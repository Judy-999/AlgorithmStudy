//
//  BOJ_1157.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/4/24.
//

import Foundation

func answer_BOJ_단어공부_1157() {
    let dict = Dictionary(readLine()!.uppercased().map {($0, 1)}, uniquingKeysWith: +)
    
    guard dict.keys.count > 1 else {
        print(dict.keys.first!)
        return
    }
    
    let sortedDict = dict.sorted(by: { $0.value > $1.value })
    print(sortedDict[0].value > sortedDict[1].value ? sortedDict[0].key : "?")
}


//func answer_BOJ_단어공부_1157() {
//    let words: [String] = Array(readLine()!).map { $0.uppercased() }
//    var dict: [String: Int] = [:]
//        
//    words.forEach {
//        dict[$0] = dict[$0, default: 0] + 1
//    }
//    
//    guard dict.keys.count > 1 else {
//        print(dict.keys.first!)
//        return
//    }
//    
//    let sortedDict = dict.sorted(by: { $0.value > $1.value })
//    print(sortedDict[0].value > sortedDict[1].value ? sortedDict[0].key : "?")
//}
