//
//  BOJ_1003.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/25/24.
//

import Foundation

func answer_BOJ_피보나치_1003() {
    let testCases = Int(readLine()!)!
    let numbers = (0..<testCases).compactMap { _ in Int(readLine()!) }
    
    numbers.forEach { n in
        var fibos = Array(repeating: (0, 0), count: n + 1)

        for i in 0...n {
            if i == 0 {
                fibos[i] = (1, 0)
            } else if i == 1 {
                fibos[i] = (0, 1)
            } else {
                fibos[i] = ((fibos[i - 1].0 + fibos[i - 2].0), (fibos[i - 1].1 + fibos[i - 2].1))
            }
        }
        
        print("\(fibos[n].0) \(fibos[n].1)")
    }
}

// 6의 개수는 5의 개수 + 4의 개수 -> n = (n - 1) + (n - 2)
