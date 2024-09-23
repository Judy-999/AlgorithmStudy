//
//  BOJ_11725.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/23/24.
//

import Foundation

func answer_BOJ_트리의부모찾기_11725() {
    let nodeCount = Int(readLine()!)!
    var nodes: [[Int]] = Array(repeating: [], count: nodeCount + 1)
    var visited = Array(repeating: false, count: nodeCount + 1)
    var parentList = Array(repeating: 0, count: nodeCount + 1)
    
    (1..<nodeCount).forEach { _ in
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        nodes[line[0]].append(line[1])
        nodes[line[1]].append(line[0])
    }
    
    func dfs(_ n: Int) {
        visited[n] = true
        
        nodes[n].forEach {
            if !visited[$0] {
                dfs($0)
                parentList[$0] = n
            }
        }
    }
    
    dfs(1)
    print(parentList[2...].map { String($0) }.joined(separator: "\n"))
}

// 각 노드의 부모를 출력한다
// 부모를 찾기...
// 최상단 부모가 아니라 바로 위 부모
//

// 1. 1부터 돌기
// 2. 추가하면서 부모 정보 넣기 -> 배열에

//  1
//  /\
// 6  4
// /  /\
// 3  7 2
// /
// 5

