//
//  PGS_77484.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/20.
//  https://school.programmers.co.kr/learn/courses/30/lessons/77484

import Foundation

// 상한, 하한을 두고 싶을 때는 min, max를 사요하면 된다
func answer_PGS_로또의최고순위와최저순위(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let winNumbers = Set(win_nums)
    let currentRank = min(7 - winNumbers.intersection(lottos).count, 6)
    let randomNumber = lottos.filter { $0 == 0 }.count
    let maxRank = max(currentRank - randomNumber, 1)

    return [maxRank, currentRank]
}
