//
//  BOJ_1697.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/23/24.
//

import Foundation

func answer_숨바꼭질_1697() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (current, target) = (input[0], input[1])
    var time = 0
    var queue: [(Int, Int)] = [(current, 0)]
    var isVisited = Array(repeating: false, count: 100000 + 1)
    var index = 0
    
    while index < queue.count  {
        let next = queue[index]
        let (n, d) = (next.0, next.1)

        time = max(time, d)

        if target == n {
            print(time)
            return
        }
        
        let directions = [n * 2, n - 1, n + 1] // 이런 식으로 다음 숫자 가능
        
        for direction in directions {
            if direction >= 0, direction <= 100000, !isVisited[direction] {
                isVisited[direction] = true // 여기서 체크해주면 따로 안해도 됨
                queue.append((direction, d + 1))
            }
        }
        index += 1 // 인덱스 방식이 빠름
    }
    
    print(time)
}
