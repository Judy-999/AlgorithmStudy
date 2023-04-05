//
//  PGS_81302.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/05.
//  https://school.programmers.co.kr/learn/courses/30/lessons/81302

import Foundation

func answer_PGS_거리두기확인하기(_ places:[[String]]) -> [Int] {
    return places.map { check($0) }
}

func check(_ place: [String]) -> Int {
    let places = place.map { $0.map { String($0) } }
    var ps = [(Int, Int)]()
    
    for (row, seats) in places.enumerated() where seats.contains("P") {
        for (column, seat) in seats.enumerated() where seat == "P" {
            ps.append((row, column))
        }
    }
    
    while ps.isEmpty == false {
        let first = ps.removeFirst()
        let manhattan = ps.filter { abs($0.0 - first.0) +  abs($0.1 - first.1) <= 2 }
        if manhattan.isEmpty { continue }
        
        for pSeat in manhattan {
            if first.0 == pSeat.0 {
               if places[first.0][(first.1 + pSeat.1) / 2] != "X" { return 0 }
            } else if first.1 == pSeat.1 {
                 if places[(first.0 + pSeat.0) / 2][first.1] != "X" { return 0 }
            } else {
               if (places[first.0][pSeat.1] == "X" && places[pSeat.0][first.1] == "X") == false { return 0 }
            }
        }
    }
    
    return 1
}
