//
//  PGS_138476.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/15.
//  https://school.programmers.co.kr/learn/courses/30/lessons/138476

import Foundation

// 처음 코드
func answer_PGS_귤고르기(_ k: Int, _ tangerine: [Int]) -> Int {
    let sortedTangerine = tangerine.sorted(by: <)
    var separated = [Int]()
    var sample = [Int]()
    var sum = 0, i = 0
    
    for tangerine in sortedTangerine {
        if sample.last == tangerine || sample.isEmpty {
            sample.append(tangerine)
        } else {
            separated.append(sample.count)
            sample = [tangerine]
        }
    }
    separated.append(sample.count)
    
    separated.sort(by: >)
    while k > sum {
        sum += separated[i]
        i += 1
    }
                     
    return i
}

// 다른 사람 풀이 참고 코드
func answer_PGS_귤고르기2(_ k: Int, _ tangerine: [Int]) -> Int {
    var tangerines = [Int: Int]()
    var sum = 0, index = 0
    
    tangerine.forEach {
        tangerines[$0] = (tangerines[$0] ?? 0) + 1
    }
    
    for number in tangerines.sorted(by: { $0.value > $1.value }) {
        sum += number.value
        index += 1
        if sum >= k { break }
    }

    return index
}
