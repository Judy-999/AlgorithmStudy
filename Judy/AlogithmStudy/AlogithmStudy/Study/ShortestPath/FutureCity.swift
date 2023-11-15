//
//  FutureCity.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/11/14.
//

import Foundation

func futureCity() {
    // meeting을 거쳐서 companey로 가는 최단 거리
    let numbers = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var pathList = [[Int]]()
    
    for _ in 0..<numbers[1] {
        let path = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
        pathList.append(path)
        pathList.append(path.reversed())
    }
    
    let targets = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    let meeting = targets[1]
    let companey = targets[0]
    let toMeeting = findShortestPath(pathes: pathList, startPoint: 1, targetPoint: meeting)
    let toCompaney = findShortestPath(pathes: pathList, startPoint: meeting, targetPoint: companey)
    let result = toMeeting + toCompaney
    
    print(result <= 10000 ? result : -1)
}

func findShortestPath(pathes: [[Int]], startPoint: Int, targetPoint: Int) -> Int {
    var pathList = pathes
    var toTarget = [(distance: Int, point: Int)]()
    var pathCount = 10000
    
    let startPathes = pathList.filter({ $0[0] == startPoint })
    startPathes.forEach { path in // [시작, 도착]
        toTarget.append((1, path[1]))
    }
    pathList = pathList.filter { !startPathes.contains($0) }
    
    while toTarget.isEmpty == false {
        let somePath = toTarget.removeLast()
        if somePath.point == targetPoint {
            pathCount = min(somePath.distance, pathCount)
            continue
        }
        
        let nextPoints = pathList.filter { $0[0] == somePath.point }
        nextPoints.forEach { path in // [somePath.point, 도착]
            toTarget.append((somePath.distance + 1, path[1]))
        }
        pathList = pathList.filter({ !nextPoints.contains($0) })
    }
    
    return pathCount
}

//입력:
//5 7
//1 2
//1 3
//1 4
//2 4
//3 4
//3 5
//4 5
//4 5
//결과: 3

//입력:
//4 2
//1 3
//2 4
//3 4
//결과: -1
