//
//  BOJ_2667.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/23/24.
//

import Foundation

func answer_BOJ_단지번호붙이기_2667() {
    let lineCount = Int(readLine()!)!
    var aparts: [[Int]] = []
    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    
    (0..<lineCount).forEach { _ in
        let list: [Int] = Array(readLine()!).compactMap { Int(String($0)) }
        aparts.append(list)
    }
    
    var visited = Array(repeating: Array(repeating: false, count: lineCount), count: lineCount)
    var index = 0
    var count = 0
    var countList = [Int]()
    
    func dfs(_ i: Int, _ j: Int) {
        visited[i][j] = true
        index += 1
        
        for direction in directions {
            let nx = i + direction.0
            let ny = j + direction.1
            
            if nx >= 0, nx < lineCount, ny >= 0, ny < lineCount,
                aparts[nx][ny] == 1, !visited[nx][ny] {
                aparts[nx][ny] = -1
                dfs(nx, ny)
            }
        }
    }
    
    for i in 0..<lineCount {
        for j in 0..<lineCount {
            if aparts[i][j] == 1, !visited[i][j] {
                dfs(i, j)
                countList.append(index)
                index = 0
                count += 1
            }
        }
    }
    
    print(count)
    print(countList.sorted().map { String($0) }.joined(separator: "\n"))
}


// BFS
//func answer_BOJ_단지번호붙이기_2667() {
//    let lineCount = Int(readLine()!)!
//    var aparts: [[Int]] = []
//    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
//    
//    (0..<lineCount).forEach { _ in
//        let list: [Int] = Array(readLine()!).compactMap { Int(String($0)) }
//        aparts.append(list)
//    }
//    
//    var visited = Array(repeating: Array(repeating: false, count: lineCount), count: lineCount)
//    var queue: [(x: Int, y: Int)] = []
//    var index = 0
//    var count = 0
//    var countList = [Int]()
//    
//    for i in 0..<lineCount {
//        for j in 0..<lineCount {
//            if aparts[i][j] == 1, !visited[i][j] {
//                queue.append((i, j))
//                
//                while index < queue.count { // !queue.isEmpty {
//                    let apart = queue[index] // queue.removeFirst()
//
//                    for direction in directions {
//                        let nx = apart.x + direction.0
//                        let ny = apart.y + direction.1
//                        
//                        if nx >= 0, nx < lineCount, ny >= 0, ny < lineCount, 
//                            aparts[nx][ny] == 1, !visited[nx][ny] {
//                            queue.append((nx, ny))
//                            visited[i][j] = true
//                            aparts[nx][ny] = -1
//                        }
//                    }
//                    index += 1
//                }
//                
//                countList.append(index)
//                index = 0
//                queue = []
//                count += 1
//            }
//        }
//    }
//    
//    print(count)
//    print(countList.sorted().map { String($0) }.joined(separator: "\n"))
//}

// 1. 전체 개수 세기 -> 연결 노드 세기
// 2. 각 트리 별 개수 세기 -> array 후 정렬
