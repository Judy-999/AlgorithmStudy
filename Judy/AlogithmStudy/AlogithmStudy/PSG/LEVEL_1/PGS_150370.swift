//
//  PGS_150370.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/22.
//  https://school.programmers.co.kr/learn/courses/30/lessons/150370

import Foundation

func answer_PGS_개인정보수집유효기간(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let todayDate = toDate(today)
    let termList = terms.map { $0.components(separatedBy: " ") }
    var termDic = [String: Int]()
    let privacyList = privacies.map { $0.components(separatedBy: " ") }
    var result = [Int]()
    
    termList.forEach {
        termDic[$0[0]] = Int($0[1]) ?? 0
    }
    
    for (index, privacy) in privacyList.enumerated() {
        let day = toDate(privacy[0])
        if let term = termDic[privacy[1]],
           let limit = Calendar.current.date(byAdding: .month, value: term, to: day) {
            if todayDate >= limit {
                result.append(index + 1)
            }
        }
    }
    
    return result
}

func toDate(_ date: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy.MM.dd"
    return dateFormatter.date(from: date)!
}
