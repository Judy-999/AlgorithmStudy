//
//  PGS_92334.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/17.
//  https://school.programmers.co.kr/learn/courses/30/lessons/92334

import Foundation

func answer_PGS_신고결과받기(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportList = [String: Set<String>]()
    var mailed = [String: Int]()
    let reports = report.map { $0.components(separatedBy: " ")}
    
    id_list.forEach {
        reportList[$0] = Set<String>()
        mailed[$0] = 0
    }
    
    for report in reports {
        reportList[report[1]]?.insert(report[0])
    }
    
    for report in reportList {
        if report.value.count >= k {
            report.value.forEach { mailed[$0]! += 1  }
        }
    }

    return id_list.map { mailed[$0]! }
}
