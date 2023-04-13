//
//  PGS_42583.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/13.
//  https://school.programmers.co.kr/learn/courses/30/lessons/42583

import Foundation

func answer_PGS_다리를지나는트럭(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var onBridge = [Int]()
    var times = [Int]()
    var index = 0
    var allTime = 0
    
    while index < truck_weights.count {
        if let time = times.first, time >= bridge_length {
            onBridge.removeFirst()
            times.removeFirst()
        }
        
        if onBridge.reduce(0, +) + truck_weights[index] <= weight {
            onBridge.append(truck_weights[index])
            times.append(0)
            index += 1
        }
        
        allTime += 1
        times = times.map { $0 + 1 }
    }

    return allTime + bridge_length
}
