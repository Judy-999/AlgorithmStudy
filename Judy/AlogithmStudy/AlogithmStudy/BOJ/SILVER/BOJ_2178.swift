//
//  BOJ_2178.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/22/24.
//

import Foundation

func answer_미로탐색_2178() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (n, m) = (input[0], input[1])
    var miro: [[Character]] = []
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    
    (0..<n).forEach { _ in
        let stt = readLine()!
        miro.append(Array(stt))
    }
    
    var isVisited = Array(repeating: Array(repeating: false, count: m), count: n)
    var queue: [(step: (x: Int, y: Int), count: Int)] = [((0, 0), 1)]
    
    while !queue.isEmpty {
        let next = queue.removeFirst()
        
        if next.step == (n - 1, m - 1) {
            print(next.count)
            return
        }
        
        guard isVisited[next.step.x][next.step.y] != true else { continue }
        isVisited[next.step.x][next.step.y] = true

        for direction in directions {
            let x = next.step.x + direction.0
            let y = next.step.y + direction.1
            
            if x >= 0, x < n, y >= 0, y < m, miro[x][y] == "1" {
                queue.append(((x, y), next.count + 1))
            }
        }
    }
}
