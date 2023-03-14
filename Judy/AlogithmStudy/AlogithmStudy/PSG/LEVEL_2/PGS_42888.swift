//
//  PGS_42888.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/14.
//  https://school.programmers.co.kr/learn/courses/30/lessons/42888

import Foundation

func answer_PGS_오픈채팅방(_ record:[String]) -> [String] {
    let records = record.map { $0.components(separatedBy: " ") }
    let changeList = records.filter { $0.contains("Change") || $0.contains("Enter")}
    var nickName = [String: String]()
    var result = [String]()

    for info in changeList {
        nickName[info[1]] = info[2]
    }

    for history in records {
        if history[0] == "Enter" {
            result.append("\(nickName[history[1]]!)님이 들어왔습니다.")
        } else if history[0] == "Leave" {
             result.append("\(nickName[history[1]]!)님이 나갔습니다.")
        }
    }

    return result
}
