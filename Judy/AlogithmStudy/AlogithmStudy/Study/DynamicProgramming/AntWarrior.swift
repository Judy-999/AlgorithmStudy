//
//  AntWarrior.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/10/31.
//

import Foundation

func antWarrior() {
    _ = Int(readLine()!)!
    let stocks = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var index = 0
    var sum = 0
    
    while index + 2 < stocks.count {
        let first = stocks[index + 1]
        let second = stocks[index + 2]
        
        sum += max(first, second)
        index = first >= second ? index + 1 : index + 2
    }
    
    print(sum)
}
