//
//  BOJ_10773.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/27/24.
//

import Foundation

func answer_BOJ_제로_10773() {
    let count = Int(readLine()!)!
    let numbers = (0..<count).compactMap { _ in Int(readLine()!) }
    var stack: [Int] = []
    
    for number in numbers {
        if number == 0 {
            stack.removeLast()
        } else {
            stack.append(number)
        }
    }
    
    print(stack.reduce(0, +))
}
