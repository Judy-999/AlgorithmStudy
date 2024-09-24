//
//  BOJ_9095.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/24/24.
//

import Foundation

func answer_BOJ_123더하기_9095() {
    let cases = Int(readLine()!)!
    let targets = (0..<cases).compactMap { _ in Int(readLine()!) }
    
    for target in targets {
        var numbers = Array(repeating: 0, count: target + 1)

        if target < 4 {
            print(target == 3 ? 4 : target)
            continue
        }
        
        numbers[1] = 1
        numbers[2] = 2
        numbers[3] = 4
        
        for i in 4...target {
            numbers[i] = numbers[i - 1] + numbers[i - 2] + numbers[i - 3]
        }
        
        print(numbers[target])
    }
}

//    1: (1)
//    1
//
//    2: (2)
//    2
//    1 + 1
//
//    3: (4)
//    1 + 1 + 1
//    1 + 2
//    2 + 1
//    3
//
//    4:
//    1+1+1 +1 --> 3만들기에 + 1
//    1+2 +1
//    2+1 +1
//    3 +1
    
//    1+1 +2  --> 2만들기에 + 2
//    2 +2
    
//    1 +3  --> 1만들기에 + 3
    
