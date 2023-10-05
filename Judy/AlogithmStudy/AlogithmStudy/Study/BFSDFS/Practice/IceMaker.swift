//
//  IceMaker.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/10/05.
//

import Foundation

func iceMaker() {
    let size = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    let udlr: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    var iceCube = [[Int]]()
    var count = 0
    
    for _ in 0..<size[0] {
        let m = readLine()!.compactMap { Int(String($0)) }
        iceCube.append(m)
    }
    
    func dfs(_ i: Int, _ j: Int) -> Bool {
        if i < 0 || i >= size[0] ||
           j < 0 || j >= size[1] { // 범위 이내인지
            return false
        }
        
        if iceCube[i][j] == 0 {
            iceCube[i][j] = 1
            
            for step in udlr {
                let next = (i + step.0, j + step.1) // 다음 지점
                _ = dfs(next.0, next.1)
            }
            return true
        }
        
        return false
    }
    
    for i in 0..<size[0] {
        for j in 0..<size[1] {
            if dfs(i, j) == true {
                count += 1
            }
        }
    }
    
    print(count)
}

//15 14
//00000111100000
//11111101111110
//11011101101110
//11011101100000
//11011111111111
//11011111111100
//11000000011111
//01111111111111
//00000000011111
//01111111111000
//00011111111000
//00000001111000
//11111111110011
//11100011111111
//11100011111111
