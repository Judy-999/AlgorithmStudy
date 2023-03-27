//
//  PGS_17686.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/27.
//  https://school.programmers.co.kr/learn/courses/30/lessons/17686

import Foundation

func answer_PGS_파일명정렬(_ files:[String]) -> [String] {
    var fileList = [[String]: String]()
    var filee = [[String]]()
    
    for file in files {
        var head = "", number = ""

        for word in file {
            let w = String(word)

            if Int(w) == nil {
                if number.isEmpty == false { break }
                head += w
            } else {
                number += w
            }
        }
        
        fileList[[head, number, file]] = file
        filee.append([head, number, file])
    }
        
    filee.sort(by: { ($0[0].uppercased(), Int($0[1]) ?? 0) < ($1[0].uppercased(), Int($1[1]) ?? 0) })
    
    return filee.compactMap { fileList[$0] }
}
