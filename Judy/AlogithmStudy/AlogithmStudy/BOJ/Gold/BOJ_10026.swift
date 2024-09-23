//
//  BOJ_10026.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/23/24.
//

import Foundation

func answer_BOJ_적록색약_10026() {
    let lineCount = Int(readLine()!)!
    var colorList: [[Character]] = []
    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    var visited = Array(repeating: Array(repeating: false, count: lineCount), count: lineCount)
    var counts = [0, 0]
   
    
    (0..<lineCount).forEach { _ in
        let input = Array(readLine()!)
        colorList.append(input)
    }
    
    var colors = colorList
    
    func dfs(_ i: Int, _ j: Int, _ c: Character, _ sight: Bool = false) {
        visited[i][j] = true
        colors[i][j] = "0"
        
        for direction in directions {
            let nx = i + direction.0
            let ny = j + direction.1
            
            if nx >= 0, nx < lineCount, ny >= 0, ny < lineCount,
                !visited[nx][ny], isCased(c, colors[nx][ny], sight) {
                dfs(nx, ny, c, sight)
            }
        }
        
    }
    
    for i in 0..<lineCount {
        for j in 0..<lineCount {
            if !visited[i][j] {
                dfs(i, j, colors[i][j])
                counts[0] += 1
            }
        }
    }
    
    colors = colorList
    visited = Array(repeating: Array(repeating: false, count: lineCount), count: lineCount)
    
    for i in 0..<lineCount {
        for j in 0..<lineCount {
            if !visited[i][j] {
                dfs(i, j, colors[i][j], true)
                counts[1] += 1
            }
        }
    }
    
    print(counts.map { String($0) }.joined(separator: " "))
}

func isCased(_ a: Character, _ b: Character, _ problem: Bool) -> Bool {
    let colors: [Character] = ["R", "G"]
    if problem {
        return (colors.contains(a) && colors.contains(b)) || (a == b)
    }
    return a == b
}


// 적록색약 -> R == G
// 이어진 뭉치 찾는 문제
// R == G 인 버전 / 다른 버전

