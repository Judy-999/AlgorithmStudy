//
//  adventurersGuild.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/04.
//

import Foundation

func greedyExam1() -> Int {
    let count = Int(readLine()!)! // 이거 왜 필요하지
    var horrors = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var guild: [Int] = []
    var result = 0
    
    horrors.sort(by: >)
    
    while let man = horrors.popLast() {
        guild.append(man)
        
        if guild.max() == guild.count {
            result += 1
            guild.removeAll()
        }
    }
    
    return result
}

/*
 입력:
 5
 2 3 1 2 2

 결과: 2
 */
