//
//  PGS_64061.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/14.
//

import Foundation

func answer_PGS_크레인인형뽑기게임(_ board:[[Int]], _ moves:[Int]) -> Int {
    var boards = board
    var results = [Int]()
    let max = board.first!.count
    var count = 0
    
    for move in moves {
        for i in 0..<max {
            let block = boards[i][move - 1]
            if block != 0 {
                if results.last == block {
                    results.removeLast()
                    count += 2
                } else {
                    results.append(block)
                }
                boards[i][move - 1] = 0
                break
            }
        }
    }
    
    return count
}
