//
//  PGS_42586.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/10.
//  https://school.programmers.co.kr/learn/courses/30/lessons/42586

import Foundation

func answer_PGS_기능개발(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    let dueDates = zip(progresses, speeds).map { (progress, speed) in
        Int(ceil((100.0 - Double(progress)) / Double(speed)))
    }
    var deadLine = dueDates.first!
    var count = 0
    var result = [Int]()
    
    for date in dueDates {
        if date <= deadLine {
            count += 1
            continue
        }
        
        result.append(count)
        count = 1
        deadLine = date
    }
    result.append(count)
    
    return result
}
