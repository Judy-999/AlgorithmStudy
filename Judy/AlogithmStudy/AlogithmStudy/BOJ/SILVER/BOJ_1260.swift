//
//  BOJ_1260.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/4/24.
//

import Foundation
// S2 - https://www.acmicpc.net/problem/1260

func answer_BOJ_DFS와BFS_1260() {
    let input: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (nodeCount, lintCount, startNode) = (input[0], input[1], input[2])
    
    var nodes: [[Int]] = Array(repeating: [], count: nodeCount + 1)
    var visited: [Bool] = Array(repeating: false, count: nodeCount + 1)
    var dfsList: [Int] = []
    var bfsList: [Int] = []
    
    (0..<lintCount).forEach { _ in
        let input: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
        nodes[input[0]].append(input[1])
        nodes[input[1]].append(input[0])
    }
    
    nodes = nodes.map { $0.sorted(by: <) }
    
    func dfs(_ i: Int) {
        visited[i] = true
        dfsList.append(i)
        
        for node in nodes[i] {
            if visited[node] == false {
                dfs(node)
            }
        }
    }
    
    dfs(startNode)

    visited = Array(repeating: false, count: nodeCount + 1)
    var searchNodes: [Int] = [startNode]
    
    while !searchNodes.isEmpty {
        let node = searchNodes.removeFirst()
        
        guard visited[node] == false else { continue }
        
        visited[node] = true
        bfsList.append(node)
        
        nodes[node].forEach {
            searchNodes.append($0)
        }
    }
    
    print(dfsList.map({ String($0) }).joined(separator: " "))
    print(bfsList.map({ String($0) }).joined(separator: " "))
}
