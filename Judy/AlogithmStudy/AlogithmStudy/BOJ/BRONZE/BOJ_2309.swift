//
//  BOJ_2309.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/20/24.
//

import Foundation

func answer_BOJ_일곱난쟁이_2309() {
    let heights: [Int] = (0..<9).compactMap { _ in Int(readLine()!) }
    let total = heights.reduce(0, +)
    
    for i in 0..<9 {
        for n in (i + 1)..<9 {
            let sum = total - (heights[i] + heights[n])
            if sum == 100 {
                print(heights.filter { ($0 != heights[i]) && ($0 !=  heights[n]) }.sorted().map { String($0) }.joined(separator: "\n"))
                return
            }
        }
    }
}
