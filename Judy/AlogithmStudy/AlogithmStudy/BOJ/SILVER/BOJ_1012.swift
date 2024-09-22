//
//  BOJ_1012.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/22/24.
//

import Foundation

func answer_BOJ_유기농배추_1012() {
    let test = Int(readLine()!)!
    var testCases: [배추] = []
    
    (0..<test).forEach { _ in
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        let (m, n, count) = (input[0], input[1], input[2])
        var nodes: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
        var list: [(Int, Int)] = []
        
        (0..<count).forEach { _ in
            let node = readLine()!.split(separator: " ").compactMap { Int($0) }
            nodes[node[0]][node[1]] = 1
            list.append((node[0], node[1]))
        }
        
        testCases.append(배추(m: m, n: n, nodes: nodes, list: list))
    }
    
    testCases.forEach { 유기농배추($0.m, $0.n, $0.nodes, $0.list) }
}

struct 배추 {
    let m: Int
    let n: Int
    let nodes: [[Int]]
    let list: [(Int, Int)]
}

func 유기농배추(_ m: Int, _ n: Int, _ nodes: [[Int]], _ list: [(Int, Int)]) {
    var isVisited = Array(repeating: Array(repeating: false, count: n), count: m)
    var list = list
    let directions = [(1, 0), (0, 1), (-1, 0), (0, -1)]
    var queue: [(x: Int, y: Int)] = [list.removeFirst()]
    var total = 1
    
    while !list.isEmpty {
        if queue.isEmpty {
            queue.append(list.removeFirst())
            total += 1
        }
        let ground = queue.removeFirst()
        
        guard isVisited[ground.x][ground.y] == false else { continue }
        isVisited[ground.x][ground.y] = true
        
        list.removeAll(where: { $0 == ground })
        for direction in directions {
            let nx = ground.x + direction.0
            let ny = ground.y + direction.1
            
            if nx >= 0, nx < m, ny >= 0, ny < n, nodes[nx][ny] == 1 {
                queue.append((x: nx, y: ny))
            }
        }
    }
    
    print(total)
}
