//
//  PGS_42842.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/27.
//  https://school.programmers.co.kr/learn/courses/30/lessons/42842

import Foundation

func answer_PGS_카펫(_ brown:Int, _ yellow:Int) -> [Int] {
    var width = 0, height = 0
    
    for block in 1...((yellow + 1) / 2) where yellow % block == 0 {
        let brownBlock = (block + (yellow / block)) * 2 + 4
        if brownBlock == brown {
            height = block + 2
            width = (yellow / block) + 2
            break
        }
    }
    
    return [width, height]
}
