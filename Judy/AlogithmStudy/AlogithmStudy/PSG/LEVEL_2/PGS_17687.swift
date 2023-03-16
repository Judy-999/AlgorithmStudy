//
//  PGS_17687.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/16.
//  https://school.programmers.co.kr/learn/courses/30/lessons/17687

func answer_PGS_n진수게임(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var results = [Character]()
    var number = 0
    
    while results.count <= t * m {
        results += String(number, radix: n).map { $0 }
        number += 1
    }
    
    var samples = ""
    var time = p - 1
    
    while samples.count < t {
        samples += String(results[time])
        time += m
    }
    
    return samples.uppercased()
}
