//
//  adventurersGuild.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/04.
//

import Foundation

func greedyExam1() -> Int {
    let count = Int(readLine()!)! // 이거 왜 필요하지 (안필요)
    var horrors = readLine()!.components(separatedBy: " ").compactMap { Int($0) }.sorted(by: >)
    var guild: [Int] = []
    var result = 0
    
    while let man = horrors.popLast() { // 공포도 낮은 사람부터 넣기
        guild.append(man) // 일단 그룹에 추가
        
        if guild.max() == guild.count { // 그룹원 중에 최대 공포도가 그룹원 수랑 같으면 그룹 수 추가
            result += 1
            guild.removeAll() // 그룹 초기화
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
