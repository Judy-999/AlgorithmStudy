//
//  choiceBollingBall.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/07.
//

import Foundation

func choiceBollingBall() -> Int {
    let _ = readLine()!.components(separatedBy: " ").compactMap { Int($0) } // 이거 사용 안함
    var balls = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var result = 0
    
    while let firstBall = balls.popLast() {
        result += balls.filter { $0 != firstBall }.count
    }
    
    return result
}
//1 1 1
//2 2 2
//3 3 3
//4
