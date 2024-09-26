//
//  BOJ_1764.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/26/24.
//

import Foundation

func answer_BOJ_듣보잡_1764() { 
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (h, s) = (input[0], input[1])
    let cantHear = Set((0..<h).compactMap { _ in readLine() })
    let cantSee = Set((0..<s).compactMap { _ in readLine() })
    let cantHearAndSee = cantSee.intersection(cantHear)
    
    print(cantHearAndSee.count)
    print(cantHearAndSee.sorted().joined(separator: "\n"))
}

// 듣, 보 -> 듣보
// 듣듣듣 보보보보 -> 에서 공통된 사람 출력
