//
//  MiroEscape.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/10/05.
//

import Foundation

func miroEscape() {
    let exit = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    let udlr: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    var miro = [[Int]]()
    var counts = [Int]()
    
    for _ in 0..<exit[0] {
        let m = readLine()!.compactMap { Int(String($0)) }
        miro.append(m)
    }
    
    func dfs(_ i: Int, _ j: Int, count: Int, routes: [(Int, (Int))]) {
        if i == exit[0] - 1, j == exit[1] - 1 {
            counts.append(count)
            return
        }
        
        for step in udlr {
            let next = (i + step.0, j + step.1) // 다음 지점
            if next.0 >= 0, next.0 < exit[0],
               next.1 >= 0, next.1 < exit[1] { // 범위 이내인지
                if miro[next.0][next.1] != 0, // 길이 막혀있지 않고, 이전에 지나온 길이 아닌지
                   !routes.contains(where: { $0.0 == next.0 && $0.1 == next.1 })  {
                    dfs(next.0, next.1, count: count + 1, routes: routes + [(i, j)])
                }
            }
        }
    }
    
    dfs(0, 0, count: 1, routes: [])
    
    print(counts.min()!)
}
