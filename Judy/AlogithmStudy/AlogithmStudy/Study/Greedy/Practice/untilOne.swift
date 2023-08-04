//
//  untilOne.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/04.
//

import Foundation

func untilOne_04() -> Int {
    let numbers = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var number = numbers[0]
    let k = numbers[1]
    var count = 0
    
//    while number != 1 { 1이 아니더라도 빼기로 해야함 (정답 수정)
    while number >= k {
        count += 1
        if number % k == 0 {
            number /= k
            continue
        }
        
        number -= 1
    }
    
    count += (number - 1)
    return count
}


// 입력: 25 5
// 결과: 2
