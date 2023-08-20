//
//  numberCardGame.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/04.
//

import Foundation

func numberCardGame_03() -> Int {
    let rowAndColumn = readLine()!.components(separatedBy: " ")
    var arrays: [Int] = []
    
    // 행에서 가장 작은 수를 뽑고 그 중에서 가장 큰 수를 찾기
    for _ in 0..<Int(rowAndColumn[0])! {
        let row = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
        arrays.append(row.min()!)
    }
    
    return arrays.max()!
}

/*
 입력 1:
 3 3
 3 1 2
 4 1 4
 2 2 2

 결과 2: 2
 
 입력 2:
 2 4
 7 3 1 8
 3 3 3 4

 결과 2: 3
*/
