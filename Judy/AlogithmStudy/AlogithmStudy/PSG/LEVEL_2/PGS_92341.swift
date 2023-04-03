//
//  PGS_92341.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/03.
//  https://school.programmers.co.kr/learn/courses/30/lessons/92341

import Foundation

func answer_PGS_주차요금계산(_ fees:[Int], _ records:[String]) -> [Int] {
    let separatedRecords = records.map { $0.components(separatedBy: " ") }
    let inRecords = separatedRecords.filter { $0[2] == "IN"}
    var outRecords = separatedRecords.filter { $0[2] == "OUT"}
    var result = [String: Int]()
    var costs = [Int]()
    
    for record in inRecords {
        let outRecord = outRecords.filter { $0[1] == record[1] }
        let endTime = outRecord.isEmpty ? "23:59" : outRecord.first![0]

        if let out = outRecord.first, let index = outRecords.firstIndex(of: out) {
            outRecords.remove(at: index)
        }
        
        result[record[1]] = (result[record[1]] ?? 0) + calculate(record[0], endTime)
    }

    for time in result.sorted(by: { $0.key < $1.key }).map({ $0.value }) {
        var cost = fees[1]
        let overTime = time - fees[0]
        
        if overTime > 0 {
            let bonus = Int(ceil((Double(overTime) / Double(fees[2])))) * fees[3]
            cost += bonus
        }
        
        costs.append(cost)
    }
        
    return costs
}

func calculate(_ start: String, _ end: String) -> Int {
    let startTime = start.components(separatedBy: ":").compactMap { Int($0) }
    let endTime = end.components(separatedBy: ":").compactMap { Int($0) }
    
    return endTime[1] - startTime[1] + (endTime[0] - startTime[0]) * 60
}
