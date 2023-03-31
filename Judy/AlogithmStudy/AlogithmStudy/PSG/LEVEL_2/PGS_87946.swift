//
//  PGS_87946.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/31.
//  https://school.programmers.co.kr/learn/courses/30/lessons/87946

import Foundation

func answer_PGS_피로도(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var dungeonList = [Int]()
    
    func adventure(_ list: [[Int]], _ depth: Int) {
        dungeonList.append(calculate(k, list))
        
        if depth == dungeons.count { return }
        
        for remain in dungeons.filter({ !list.contains($0) }) {
            adventure(list + [remain], depth + 1)
        }
    }
    
    adventure([], 0)
    return dungeonList.max()!
}

func calculate(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var fatigue = k
    
    for (index, dungeon) in dungeons.enumerated() {
        if fatigue < dungeon[0] {
            return index
        }
        
        fatigue -= dungeon[1]
    }
    
    return dungeons.count
}
