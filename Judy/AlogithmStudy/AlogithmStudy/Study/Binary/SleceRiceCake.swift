//
//  SleceRiceCake.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/10/25.
//

import Foundation

func sleceRiceCake() {
    let numbers = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    let riceCakes = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    let amount = numbers[1]
    var end = riceCakes.max()!
    var start = 0
    var height = 0
    
    let starttime = CFAbsoluteTimeGetCurrent()

    while true { // start < end로 하는게 적절할 듯
        height = (start + end) / 2
        let sum = sumRiceCake(riceCakes, height: height)
        
        if amount == sum {
            break
        } else if amount > sum { // 나머지 양이 더 적다? -> 높이를 낮춰서 더 잘리도록
            end = height - 1
        } else { // 나머지 양이 더 많다? -> 높이를 높여서 덜 잘리도록
            start = height + 1
        }
    }
    
    print(height)
    print(CFAbsoluteTimeGetCurrent() - starttime)
}

func sumRiceCake(_ array: [Int], height: Int) -> Int {
    return array.map { $0 - height }.filter { $0 > 0 }.reduce(0, +)
}
