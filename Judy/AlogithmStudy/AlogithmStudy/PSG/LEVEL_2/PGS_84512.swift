//
//  PGS_84512.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/29.
//  https://school.programmers.co.kr/learn/courses/30/lessons/84512

import Foundation

func answer_PGS_모음사전(_ word:String) -> Int {
    var dic =  ["A": 0, "E": 1, "I": 2, "O": 3, "U": 4]
    var count = 0
    
    for (index, w) in word.enumerated() {
        let priority = dic[String(w)]!
      
        if priority == 0 {
            count += 1
            continue
        }
        
        var c = 0
        for i in 1..<(5-index) {
            c += Int(pow(Double(5), Double(i)))
        }
        
        count += c * priority + priority + 1
    }

    return count
}
