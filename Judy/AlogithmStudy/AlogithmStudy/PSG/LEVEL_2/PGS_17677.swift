//
//  PGS_17677.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/23.
//  https://school.programmers.co.kr/learn/courses/30/lessons/17677

import Foundation

func answer_PGS_뉴스클러스터링(_ str1: String, _ str2: String) -> Int {
    let first = str1.uppercased().map { String($0) }
    let second = str2.uppercased().map { String($0) }
    let firstList = makeMultiSet(first)
    var secondList = makeMultiSet(second)
    var count = 0
    let sum = firstList.count + secondList.count
    
    for word in firstList {
        if secondList.contains(word) {
            count += 1
            secondList.remove(at: secondList.firstIndex(of: word)!)
        }
    }

    return sum == 0 ? 65536 : Int(Double(count) / Double(firstList.count + secondList.count) * 65536)
}

func makeMultiSet(_ list: [String]) -> [String] {
    let alphavet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var i = 0
    var result = [String]()
    
    while i + 1 < list.count {
        if alphavet.contains(list[i]) && alphavet.contains(list[i + 1]) {
         result.append(list[i] + list[i + 1])
        }
        i += 1
    }
    
    return result
}

// 제출버전
func answer_PGS_뉴스클러스터링1(_ str1: String, _ str2: String) -> Int {
    let alphavet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let first = str1.uppercased().map { String($0) }
    let second = str2.uppercased().map { String($0) }
    var firstList = [String](), secondList = [String]()
    var i = 0, count = 0

    while i + 1 < first.count {
        if alphavet.contains(first[i]) && alphavet.contains(first[i + 1]) {
         firstList.append(first[i] + first[i + 1])
        }
        i += 1
    }

    i = 0
    while i + 1 < second.count {
        if alphavet.contains(second[i]) && alphavet.contains(second[i + 1]) {
         secondList.append(second[i] + second[i + 1])
        }
        i += 1
    }

    let sum = firstList.count + secondList.count
    for word in firstList {
        if secondList.contains(word) {
            count += 1
            secondList.remove(at: secondList.firstIndex(of: word)!)
        }
    }

    return sum == 0 ? 65536 : Int(Double(count) / Double(firstList.count + secondList.count) * 65536)
}
