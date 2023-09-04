//
//  gameDevelop.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/30.
//

import Foundation

func gameDevelop() {
    let size = readLine()!.components(separatedBy: " ").compactMap { Int($0)! }
    let start = readLine()!.components(separatedBy: " ").compactMap { Int($0)! }
    let step: [Int: (Int, Int)] = [0: (-1, 0), 1: (0, 1), 2: (0, -1), 3: (1, 0)]
    var map: [[Int]] = []
    var currentPoint = (start[0], start[1])
    var count = 1
    var chance = 0
    
    for _ in 0..<size[0] {
        let line = readLine()!.components(separatedBy: " ").compactMap { Int($0)! }
        map.append(line)
    }
    
    map[currentPoint.0][currentPoint.1] = 1
    
    while true {
        if chance == 4 {
            break
        }

        let next = step[chance]!
        let x = currentPoint.0 + next.0
        let y = currentPoint.1 + next.1

        chance += 1
        
        if x < 0 || x >= size[0] || y < 0 || y >= size[1] {
            continue
        }

        if map[x][y] == 0 {
            currentPoint = (x, y)
            count += 1
            chance = 0
            map[x][y] = 1
        }
    }
    
    print(count)
}
//        let direction = currentPoint.2 - 1 < 0 ? 3 : currentPoint.2 - 1
//        let next = step[direction]!


//1111
//10011
//11001
//11011
//11011
// 다 못품
