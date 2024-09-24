//
//  BOJ_7576.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/23/24.
//

import Foundation

func answer_토마토_7576() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (m, n) = (input[0], input[1])
    var tomatos: [[Int]] = []
    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    
    (0..<n).forEach { _ in
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        tomatos.append(line)
    }

    var count = -1 // 처음을 -1로 해두면 익은 토마토만 있을 때 max(-1, 0)하고 그대로 다음 단계 없이 끝나서 0 출력 가능
    var queue: [(x: Int, y: Int, d: Int)] = []
    var index = 0
    
    for i in 0..<n {
        for j in 0..<m {
            if tomatos[i][j] == 1 {
                queue.append((i, j, 0)) // 돌 수 있는 시작점을 다 넣고 돌리면 동시에 출발 가능
            }
        }
    }
    
    while index < queue.count {
        let tomato = queue[index] // removeFirst하니까 시간초과... index로 하니 됨 ⭐️
        let (x, y, d) = (tomato.x, tomato.y, tomato.d)

        count = max(count, d)
        for direction in directions {
            let nx = x + direction.0
            let ny = y + direction.1
            
            if nx >= 0, nx < n, ny >= 0, ny < m, tomatos[nx][ny] == 0 {
                tomatos[nx][ny] = 1 // 어차피 0인 곳에만 갈거라서 따로 visited 체크 안 해줘도 됨
                queue.append((nx, ny, d + 1))
            }
        }
        index += 1
    }
    
    for row in tomatos {
        if row.contains(0) { // filter나 flatMap + Set 쓰는거보다 반복문 돌면 n 이하로 찾을 수 있음
            print("-1")
            return
        }
    }
    
    print(count)
}
