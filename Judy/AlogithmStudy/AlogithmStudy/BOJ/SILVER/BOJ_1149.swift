//
//  BOJ_1149.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/25/24.
//

import Foundation

func answer_BOJ_RGB거리_1149() {
    let houseCount = Int(readLine()!)!
    let houses = [[]] + (0..<houseCount).map { _ in readLine()!.split(separator: " ").compactMap { Int($0) } }
    var costs = Array(repeating: Array(repeating: 0, count: 3), count: houseCount + 1)

    for h in 1...houseCount {
        costs[h][0] = min(costs[h - 1][1], costs[h - 1][2]) + houses[h][0]
        costs[h][1] = min(costs[h - 1][0], costs[h - 1][2]) + houses[h][1]
        costs[h][2] = min(costs[h - 1][0], costs[h - 1][1]) + houses[h][2]
    }
    
    print(costs[houseCount].min()!)
}

// 2이상
// 각 집마다 R, G, B 금액
// 양 옆과 같은 색 불가


//1 -> 1이 아닌 이전의 최소 + 현재 1
//2 -> ...
//3 -> ...
// 이 중의 최소
// 땅따먹기 계열!
