//
//  BOJ_2468.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/24/24.
//

import Foundation

func answer_BOJ_안전영역_2468() {
    let landCount = Int(readLine()!)!
    let lands = (0..<landCount).map { _ in
        readLine()!.split(separator: " ").compactMap { Int($0) }
    }
    var visited = Array(repeating: Array(repeating: false, count: landCount), count: landCount)
    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    let maxHeight = lands.flatMap { $0 }.max()!
    var countList = Array(repeating: 0, count: maxHeight + 1)
    
    func dfs(_ i: Int, _ j: Int, _ h: Int) {
        visited[i][j] = true
        
        for direction in directions {
            let (x, y) = (i + direction.0, j + direction.1)
            
            if x >= 0, x < landCount, y >= 0, y < landCount,
               !visited[x][y], lands[x][y] > h {
                dfs(x, y, h)
            }
        }
    }
    
    (0..<maxHeight).forEach { h in // 0부터 해야함! 다 1일 수도 있으니..
        visited = Array(repeating: Array(repeating: false, count: landCount), count: landCount)
       
        for i in 0..<landCount {
            for j in 0..<landCount {
                if !visited[i][j], lands[i][j] > h {
                    dfs(i, j, h)
                    countList[h] += 1
                }
            }
        }
    }
    print(countList.max()!)
}

// 뭉탱이 수를 구하는데 기준이 N보다 큰 곳 (대각선 X)
// 영역의 수가 최대인 개수 -> 1~최대높이까지 다 계산해보고 max



