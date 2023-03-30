//
//  PGS_12980.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/30.
//  https://school.programmers.co.kr/learn/courses/30/lessons/12980

import Foundation

func answer_PGS_점프와순간이동(_ n: Int) -> Int {
    var battery = 0
    var distance = n

    while distance > 0 {
        if distance % 2 == 0 {
            distance /= 2
            continue
        }
        
        distance -= 1
        battery += 1
    }
    
    return battery
}
