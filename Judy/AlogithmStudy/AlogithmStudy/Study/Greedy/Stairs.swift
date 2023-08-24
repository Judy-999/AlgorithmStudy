//
//  Stairs.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/21.
//

import Foundation

func stairs() {
    let number = Int(readLine()!)! // 총 개수
    let numbers = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var stairs: [Int] = [] // 최고 높이 배열
    var index = 0 // 계단 순서
    var count = 1 // 계단 높이
    
    while index < number { // 계단 순서가 총 계단 순서 이내일 때
        var i = index // 현재 계단 순서
        
        while i < number && count <= numbers[i] { // 총 계단 개수 이내 && 현재 최고층을 포함하는지 확인
            i += 1
            count += 1
        }
        
        stairs.append(count - 1) //  count += 1 했으므로 1 빼서 최고층 배열에 넣기
        if i == number { break } // 이미 끝 계단에 도달했으면 끝
        count = numbers[i] // 지금 높이를 기준으로 다시 계단을 연속적으로 쌓을 수 있는지
        index = i // 현재 계단부터 비교
    }
    print(stairs.max()!) 
}
