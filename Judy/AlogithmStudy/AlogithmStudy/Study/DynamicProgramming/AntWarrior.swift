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
    var dic = [Int: Int]()
    
    dic[0] = stocks[0]
    dic[1] = max(stocks[0], stocks[1])
    
    for i in 2..<stocks.count {
        dic[i] = max((dic[i - 2] ?? 0) + stocks[i], dic[i - 1] ?? 0)
    }
    
    print(dic[stocks.count - 1]!)
}
