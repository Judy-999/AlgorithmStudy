//
//  PGS_118666.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/17.
//  https://school.programmers.co.kr/learn/courses/30/lessons/118666

import Foundation

func answer_PGS_성격유형검사하기(_ survey:[String], _ choices:[Int]) -> String {
    var dic: [Character: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    var result = ""
    
    for (question, rating) in zip(survey, choices) {
        let choice = rating < 4 ? question.first! : question.last!
        dic[choice] = dic[choice]! + abs(4 - rating)
    }
    
    let first: [Character] = ["R", "C", "J", "A"]
    let second: [Character] = ["T", "F", "M", "N"]
    
    for (f, s) in zip(first, second) {
        result += dic[f]! < dic[s]! ? String(s) : String(f)
    }
    
    
    return result
}
