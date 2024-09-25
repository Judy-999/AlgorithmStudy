//
//  BOJ_12865.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/25/24.
//

import Foundation

func answer_BOJ_평범한배낭_12865() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (c, w) = (input[0], input[1])
    var things: [(w: Int, v: Int)] = [(0, 0)] + []
    var values: [[Int]] = Array(repeating: Array(repeating: 0, count: w + 1), count: c + 1)
    
    (0..<c).forEach { _ in
        let a = readLine()!.split(separator: " ").compactMap { Int($0) }
        things.append((a[0], a[1]))
    }
    
    for i in 1...c { // 넣을 짐들
        for j in 1...w { // 가능한 무게
            if things[i].w <= j {
                values[i][j] = max(values[i - 1][j], values[i - 1][j - things[i].w] + things[i].v)
                continue
            }
            
            values[i][j] = values[i - 1][j]
        }
    }
    
    print(values[c][w])
}

// 이전에 계산해둔 이 무게의 최대 가치 vs [이 무게 - 현재 무게]의 가치 + 현재 무게의 가치
// https://icksw.tistory.com/126 참고
