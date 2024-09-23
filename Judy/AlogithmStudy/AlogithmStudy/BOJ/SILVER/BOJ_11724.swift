//
//  BOJ_11724.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/23/24.
//

import Foundation

func answer_BOJ_연결요소의개수_11724() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (nodeCount, lineCount) = (input[0], input[1])
    var nodes: [[Int]] = Array(repeating: [], count: nodeCount + 1)
    var isVisited = Array(repeating: false, count: nodeCount + 1)
    
    (0..<lineCount).forEach { _ in
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        nodes[line[0]].append(line[1])
        nodes[line[1]].append(line[0])
    }
    
    var queue: [Int] = [1]
    var count = 0
    var index = 0
    
    for i in 1...nodeCount { // 노드의 시작은 1부터
        if isVisited[i] == false {
            queue.append(i)
            
            while index < queue.count {
                let node = queue[index]
                
                for n in nodes[node] {
                    if !isVisited[n] {
                        isVisited[n] = true
                        queue.append(n)
                    }
                }
                
                index += 1
            }
            
            count += 1
        }
        
        queue = []
        index = 0
    }
    
    print(count)
}
