//
//  BOJ_4963.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/24/24.
//

import Foundation

func answer_BOJ_섬의개수_4963() {
    var testCases: [Island] = []
    
    while true {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        
        if input == [0, 0] { break }
        
        let lands = (0..<input[1]).map { _ in
            readLine()!.split(separator: " ").compactMap { Int($0) }
        }
        
        testCases.append(Island(w: input[0], h: input[1], lands: lands))
    }
    
    testCases.forEach {
        countIsland($0)
    }
}

func countIsland(_ land: Island) {
    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0), (1, 1), (-1, -1), (-1, 1), (1, -1)]
    var visited = Array(repeating: Array(repeating: false, count: land.w), count: land.h)
    var lands = land.lands
    var count = 0
    
    func dfs(_ i: Int, _ j: Int) {
        visited[i][j] = true
        
        for direction in directions {
            let (x, y) = (i + direction.0, j + direction.1)
            
            if x >= 0, x < land.h, y >= 0, y < land.w, !visited[x][y], lands[x][y] == 1 {
                lands[i][j] = -1
                dfs(x, y)
            }
        }
    }
    
    for i in 0..<land.h {
        for j in 0..<land.w {
            if !visited[i][j], lands[i][j] == 1 {
                dfs(i, j)
                count += 1
            }
        }
    }
    
    print(count)
}

struct Island {
    let w: Int
    let h: Int
    let lands: [[Int]]
}

// 여러 케이스를 주고 뭉텅이 구하는 문제
// 마지막은 0 0 으로 구분
// 대각선도 가능!
