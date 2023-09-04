//
//  night.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/28.
//

import Foundation

func night() {
    let point = readLine()!.map { String($0) }
    let alphavet = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6, "g": 7, "h": 8]
    let routes = [(2, 1), (-2, 1), (2, -1), (-2, -1), (1, 2), (1, -2), (-1, 2), (-1, -2)]
    let current = (alphavet[point[0]]!, Int(point[1])!)
    var count = 0
//    let row = Int(열.first!.asciiValue! - 96) 알파벳 유니코드
    for route in routes {
        let step = (route.0 + current.0, route.1 + current.1)
        if step.0 < 1 || step.0 > 8 || step.1 < 1 || step.1 > 8 {
            continue
        }
        count += 1
    }
    
    print(count)
}
