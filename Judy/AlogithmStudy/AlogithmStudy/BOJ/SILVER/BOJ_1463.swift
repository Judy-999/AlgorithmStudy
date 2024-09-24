//
//  BOJ_1463.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/24/24.
//

import Foundation

func answer_BOJ_1로만들기_1463() {
    let target = Int(readLine()!)!
    var numbers = Array(repeating: target + 1, count: target + 1) // 10^6일 때 오히려 dic을 쓰면 시간초과 (해시방법이라 오래걸리는듯)
    
    numbers[target] = 0
    
    for t in (1...target).reversed() {
        if t % 3 == 0 {
            numbers[t / 3] = min(numbers[t / 3], numbers[t] + 1)
        }
        
        if t % 2 == 0 {
            numbers[t / 2] = min(numbers[t / 2], numbers[t] + 1)
        }
        
        numbers[t - 1] = min(numbers[t - 1], numbers[t] + 1)
        
        if numbers[1] != target + 1 { break }
    }
    
    print(numbers[1])
}

// 재귀함수 방식
//func dp(_ n: Int) -> Int {
//    if n == 1 {
//        return 0
//    } else if n == 2 || n == 3 {
//        return 1
//    } else {
//        return min(dp(n / 2) + n % 2, dp(n / 3) + n % 3) + 1
//    }
//}

// /3, /2, -1
//
