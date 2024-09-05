//
//  BOJ_2606.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/5/24.
//

import Foundation

func answer_바이러스_2606() {
    let (computerCount, lineCount) = (Int(readLine()!)!, Int(readLine()!)!)
    var visited = Array(repeating: false, count: computerCount + 1)
    var network: [[Int]] = Array(repeating: [], count: computerCount + 1)
    var virus = 0
    
    (0..<lineCount).forEach { _ in
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        network[line[0]].append(line[1])
        network[line[1]].append(line[0])
    }
    
    func dfs(_ i: Int) {
        visited[i] = true
        
        network[i].forEach {
            if visited[$0] == false {
                dfs($0)
                virus += 1
            }
        }
    }
    
    dfs(1)
    print(virus)
}

