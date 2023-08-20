//
//  lawOfLargeNumbers_02.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/04.
//

import Foundation

func lawOfLargeNumbers_02() -> Int {
    let standard = readLine()!.components(separatedBy: " ").compactMap { Int($0) } // 숫자 개수/총 더하기 수/최대 반복수
    let numbers = readLine()!.components(separatedBy: " ").compactMap { Int($0) }.sorted(by: >)
    
    // 무조건 가장 큰 수를 최대로 반복하고 중간에 두 번째 큰 수를 넣는게 큼 ex) 6665 6665 6665...
    let max = numbers[0] // 가장 큰 수
    let secondMax = numbers[1] // 두 번째로 큰 수
    let count = standard[1] / (standard[2] + 1) // (최대 반복 + 1) 세트가 들어갈 수 있는 개수
    let remain = standard[1] % (standard[2] + 1) // 남은 개수
    let result = (max * count * standard[2]) + (secondMax * count) + (max * remain)
    // 가장 큰 값이 최대로 세트 개수 만큼 + 두 번째 큰 값이 세트 개수 만큼 + 나머지는 가장 큰 수로
    
    return result
}

// 입력:
// 5 8 3
// 2 4 5 4 6
// 결과: 46
