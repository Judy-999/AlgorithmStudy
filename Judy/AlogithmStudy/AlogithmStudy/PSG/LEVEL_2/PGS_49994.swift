//
//  PGS_49994.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/30.
//  https://school.programmers.co.kr/learn/courses/30/lessons/49994

import Foundation

func answer_PGS_방문길이(_ dirs:String) -> Int {
    let dic = ["U": (0, 1), "D": (0, -1), "R": (1, 0), "L": (-1, 0)]
    var position = Position()
    var result: [Position] = []
    
    for dir in dirs {
        let d = dic[String(dir)]!
        let nextX = position.end.x + d.0
        let nextY = position.end.y + d.1
        
        if abs(nextX) > 5 || abs(nextY) > 5 { continue }
        
        position.start = position.end
        position.end = Point(x: nextX, y: nextY)
        
        let opposite = Position(start: position.end, end: position.start)
        if result.firstIndex(of: position) == nil && result.firstIndex(of: opposite) == nil {
            result.append(position)
        }
    }
    
    return result.count
}

struct Point: Hashable {
    var x: Int
    var y: Int
}

struct Position: Hashable {
    var start: Point = Point(x: 0, y: 0)
    var end: Point = Point(x: 0, y: 0)
}


// 처음 버전
//func solution(_ dirs:String) -> Int {
//    let dic = ["U": (0, 1), "D": (0, -1), "R": (1, 0), "L": (-1, 0)]
//    var position = Position()
//    var result: [Position] = []
//
//    for dir in dirs {
//        let d = dic[String(dir)]!
//        if abs(position.end.x + d.0) > 5 || abs(position.end.y + d.1) > 5 {
//            continue
//        }
//
//        position.start = position.end
//        position.end.x += d.0
//        position.end.y += d.1
//        result.append(position)
//    }
//
//    return check(result)
//}
//
//struct Point: Hashable {
//    var x: Int
//    var y: Int
//}
//
//struct Position: Hashable {
//    var start: Point = Point(x: 0, y: 0)
//    var end: Point = Point(x: 0, y: 0)
//}
//
//func check(_ positions: [Position]) -> Int {
//    var result = [Position]()
//    for p in positions {
//        let opposite = Position(start: p.end, end: p.start)
//        if result.firstIndex(of: p) == nil && result.firstIndex(of: opposite) == nil {
//            result.append(p)
//        }
//    }
//
//    return result.count
//}
