//
//  BOJ_2579.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/25/24.
//

import Foundation

func answer_BOJ_계단오르기_2579() {
    let stairCount = Int(readLine()!)!
    let stairs = [0] + (0..<stairCount).compactMap { _ in Int(readLine()!) }
    var scores = Array(repeating: 0, count: stairCount + 1)
    
    if stairCount < 3 {
        print(stairs.reduce(0, +))
        return
    }
    
    scores[1] = stairs[1]
    scores[2] = stairs[2] + stairs[1]
    
    for n in 3...stairCount {
        scores[n] = max(scores[n - 3] + stairs[n - 1] + stairs[n], scores[n - 2] + stairs[n])
    }
    
    print(scores[stairCount])
}

// 1 2
// n에 오는 방법 -> (n - 1)에서 또는 (n - 2)에서
// 근데 (n - 1)만 세 번 연속이면 안 됨

// 5
// 3 -> 2
// 4 -> 1 (2 11 -> 1 은 안됨)


// 1 2 3 4 5
// 2 -> 5, 4 -> 5 (2 3 4 5는 안되고 2 4 5) -> (n - 3) + [n - 1]의 점수 + 현재 계단 점수 vs (n-2) + 현재 계단 점수
// 2칸 전에서 오거나 1칸이면 무조건 이전은 두 칸 전에서 온 걸로 강제하기
