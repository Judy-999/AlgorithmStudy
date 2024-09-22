//
//  BOJ_16940.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/22/24.
//

import Foundation

func answer_BOJ_BFS스페셜저지_16940() {
    let nodeCount = Int(readLine()!)!
    var nodes: [[Int]] = Array(repeating: [], count: nodeCount + 1)

    (1..<nodeCount).forEach { _ in
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        nodes[line[0]].append(line[1])
        nodes[line[1]].append(line[0])
    }
    
    var list: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
    var queue: [[Int]] = [[1]]
    var isVisited = Array(repeating: false, count: nodeCount + 1)
    var currentSequence: Set<Int> = []
    
    while !list.isEmpty {
        let node = list.removeFirst() // 다음 순서 노드
        
        if currentSequence.isEmpty && !queue.isEmpty  {
            currentSequence = Set(queue.removeFirst()) // 현재 방문할 수 있는 노드가 비워있으면 다음 방문 가능한 노드로 채우기
        }
        
        if currentSequence.contains(node) { // firstIndex(of)는 O(n)으로 시간이 많이 걸릴 수 있음 -> 단순히 있는지 확인하고 지우고 싶은거라면 Set으로 가능
            currentSequence.remove(node)
            isVisited[node] = true
            let nextNodes = nodes[node].filter { isVisited[$0] == false }
            if !nextNodes.isEmpty { queue.append(nextNodes) } // 방문할 노드 추가
        } else {
            print("0")
            return
        }
    }
    
    print(list.isEmpty ? 1 : 0)
}
