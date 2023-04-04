//
//  PGS_12981.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/04.
//  https://school.programmers.co.kr/learn/courses/30/lessons/12981

import Foundation

func answer_PGS_영어끝말잇기(_ n:Int, _ words:[String]) -> [Int] {
    var usedWords = [String]()
    
    for word in words {
        if let last = usedWords.last?.last, last != word.first {
            break
        }
        
        if usedWords.contains(word) { break }
        usedWords.append(word)
    }
    
    return words == usedWords ? [0, 0] : [usedWords.count % n + 1, usedWords.count / n + 1]
}
