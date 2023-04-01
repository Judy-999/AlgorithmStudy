//
//  PGS_42587.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/01.
//  https://school.programmers.co.kr/learn/courses/30/lessons/42587

import Foundation

func answer_PGS_프린터(_ priorities:[Int], _ location:Int) -> Int {
    var prints = priorities
    var order = location
    var count = 0
    
    while order > -1 {
        let first = prints.removeFirst()
        order -= 1
        
        if prints.filter({ $0 > first }).isEmpty == false {
            prints.append(first)
            if order == -1 {
                order = prints.count - 1
            }
            continue
        }
        
        count += 1
    }
    
    return count
}
