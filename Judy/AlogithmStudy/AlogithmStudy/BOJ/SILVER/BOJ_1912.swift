//
//  BOJ_1912.swift
//  AlogithmStudy
//
//  Created by 김주영 on 10/15/24.
//

import Foundation

func answer_BOJ_연속합() {
    let count = Int(readLine()!)!
    let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
    var sumList = numbers
    
    for i in 1..<count {
        sumList[i] = max(sumList[i], sumList[i - 1] + numbers[i])
    }

    print(sumList.max()!)
}

// 현재까지 최대 값 vs 이전 최대에서 현재를 넣은 값
