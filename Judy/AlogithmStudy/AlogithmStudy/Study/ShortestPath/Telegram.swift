//
//  Telegram.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/11/16.
//

import Foundation

func telegram() {
    // 도시의 개수, 통로의 개수, 메시지를 보내고자 하는 도시
    let numbers = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var pathList = [(start: Int, end: Int, time: Int)]()
    var totalTime = 0
    var cityCount = 0
    
    for _ in 0..<numbers[1] {
        let path = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
        pathList.append((path[0], path[1], path[2]))
    }
    
    for target in 1..<(numbers[0] + 1) {
        if target == numbers[2] { continue }
        let time = calculateTime(pathes: pathList, startPoint: numbers[2], targetPoint: target)
        if time != 0 {
            cityCount += 1
            totalTime = max(totalTime, time)
        }
    }
    print("\(cityCount) \(totalTime)")
}


func calculateTime(pathes: [(start: Int, end: Int, time: Int)], startPoint: Int, targetPoint: Int) -> Int {
    var toTarget = [(time: Int, point: Int)]()
    var totalTime = Int.max
    
    let startPathes = pathes.filter { $0.start == startPoint }
    startPathes.forEach { path in // [시작, 도착]
        toTarget.append((path.time, path.end))
    }
    
    while toTarget.isEmpty == false {
        let somePath = toTarget.removeFirst()
        if somePath.point == targetPoint {
            totalTime = min(somePath.time, totalTime)
            continue
        }
        
        let nextPoints = pathes.filter { $0.start == somePath.point }
        nextPoints.forEach { path in // [somePath.point, 도착]
            toTarget.append((somePath.time + path.time, path.end))
        }
    }
    
    return totalTime
}


//입력:
//3 2 1
//1 2 4
//1 3 2
//
//결과:
//2 4
