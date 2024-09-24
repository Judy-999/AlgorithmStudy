//
//  BOJ_1987.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/24/24.
//

import Foundation

func answer_BOJ_알파벳_1987() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (h, w) = (input[0], input[1])
    let words: [[Int]] = (0..<h).map { _ in readLine()!.compactMap { Int($0.asciiValue!) - 65 } } // 시간초과 문제로 비트마스크를 사용해야 함 
    // Character("A").asciiValue! == 65
    // 알파벳을 아스키코드로 표현
    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    var count = 0
    
    func dfs(_ i: Int, _ j: Int, _ visited: Int, _ c: Int) {
        count = max(count, c)

        for direction in directions {
            let (x, y) = (i + direction.0, j + direction.1)
            
            if x >= 0, x < h, y >= 0, y < w {
                let bitIndex = 1 << words[x][y] // 현재 알파벳을 표시한 비트
                          
                if visited & bitIndex == 0 { // 알파뱃들이 표시된 비트와 현재 알파펫을 &했을 때 1이 나오면 겹치는, 즉 이미 지나온 알파벳이라는 뜻 -> 안 겹치면 0
                    dfs(x, y, visited | bitIndex, c + 1) // 현재 알파벳도 같이 넣어서 전달
                }
            }
        }
    }
    
    // 원리: A~Z까지의 아스키값을 0부터 만들어줌 (아스키값 - 65)
    // 1 << x -> 1을 x만큼 왼쪽으로 시프트
    // 즉 고유한 Int를 가진 알파벳을 아스키값만큼 시프트시켜서 존재한 경우 1로 표시
    let startBit = 1 << words[0][0]
    dfs(0, 0, startBit, 1)
    print(count)
}

// 기준: 이전에 나온 알파벳이 아닌 글자
// 어디까지 갈 수 있는지 -> 한 번 돌 수 있는 최대
// 뭉치가 아니라 최대를 찾는거라 한 번 가보고 이 길이 아니면 다시 돌아온 길에서 새 길도 가봐야함 -> visited를 쓰지 않거나 다시 false로 풀어줌 (찾는 과정이 많아짐)
