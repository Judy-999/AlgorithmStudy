//
//  untilOne.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/04.
//

import Foundation

func untilOne_04() -> Int {
    let numbers = readLine()!.components(separatedBy: " ").compactMap { Int($0) } // 숫자 / 나누는 수
    var number = numbers[0]
    let k = numbers[1]
    var count = 0
    
//    while number != 1 { 1이 아니더라도 빼기로 해야함 (정답 수정)
    while number >= k { // 나눌 수 있을 때까지 반복
        count += 1
        if number % k == 0 {
            number /= k // 나눠지면 나누기
            continue
        }
        
        number -= 1 // 안 나눠지면 빼기
    }
    
    count += (number - 1)  // 남은 수가 있다면 그 수만큼 빼기 1 반복
    return count
}


// 입력: 25 5
// 결과: 2
