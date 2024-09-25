//
//  BOJ_11726.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/25/24.
//

import Foundation

func answer_BOJ_2xn타일링_11726() {
    let number = Int(readLine()!)!
    var numbers = Array(repeating: 1, count: number + 1)
    
    if number == 1 {
        print("1")
        return
    }
    
    for n in 2...number {
        numbers[n] = (numbers[n - 1] + numbers[n - 2]) % 10007
    }
    
    print(numbers[number])
}

// 2x2를 채우는 방법 -> 11, =
// 2x5 -> 2x3 채우기 + 2x4채우기 -> n = (n-2) + (n-3)
// 3 + = , 4 + |
