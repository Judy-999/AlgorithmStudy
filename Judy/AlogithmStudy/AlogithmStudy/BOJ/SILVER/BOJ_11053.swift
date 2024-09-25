//
//  BOJ_11053.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/25/24.
//

import Foundation

func answer_BOJ_가장긴증가하는부분수열_11053() {
    let numberCount = Int(readLine()!)!
    let numbers = [1001] + readLine()!.split(separator: " ").compactMap { Int($0) }
    var counts = Array(repeating: 1, count: numberCount + 1)
    
    for n in 1...numberCount {
        let aaa: [Int] = numbers[..<n].enumerated().compactMap {
            if $0.element < numbers[n] { return $0.offset }
            return nil
        }
        aaa.forEach {
            counts[n] = max(counts[n], counts[$0] + 1)
        }
    }
    
    print(counts.max()!) // 무조건 처음부터 하는게 아니라 최장 수열을 찾는 것이니 최대값을 출력
}

//20
//322 831 212 232 545 698 260 265 324 215 701 75 156 605 851 993 425 887 691 593

// 앞에 보다 크면 추가 가능
// 오,, 모르겠다
