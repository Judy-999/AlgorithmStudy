//
//  ExchangeElement.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/10/13.
//

import Foundation

func exchangeElement() {
    let info = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var first = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var second = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    
    first.sort(by: <)
    second.sort(by: >)
    
    for _ in 0..<info[1] {
        let min = first.removeFirst()
        let max = second.removeFirst()
        first.append(max)
        second.append(min)
    }
    
    print(first.reduce(0, +))
}


// 5 3
// 1 2 5 4 3
// 5 5 6 6 5
// 결과: 26
