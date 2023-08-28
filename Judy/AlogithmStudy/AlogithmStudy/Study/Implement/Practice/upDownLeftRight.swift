//
//  upDownLeftRight.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/28.
//

import Foundation

func upDownLeftRight() {
    let count = Int(readLine()!)!
    let routes = readLine()!.components(separatedBy: " ")
    let udlr = ["U": (-1, 0), "D": (1, 0), "L": (0, -1), "R": (0, 1)]
    var point: (Int, Int) = (1, 1)
    
    for route in routes {
        let move = udlr[route]!
        let next = (point.0 + move.0, point.1 + move.1)
        
        if next.0 > count || next.0 < 1 || next.1 > count || next.1 < 1 {
            continue
        }
        
        point = next
    }
    
    print(point)
}
