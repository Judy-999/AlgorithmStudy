//
//  priceCannotBeMade.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/04.
//

import Foundation

func priceCannotBeMade() -> Int {
    let count = Int(readLine()!)! // 이거 왜 필요하지
    var coins = readLine()!.components(separatedBy: " ").compactMap { Int($0) }.sorted(by: <)
    var min = 1

    if coins.first != 1 {
        return 1
    }

    for coin in coins {
        if min < coin {
            break
        }
        min += coin
    }
    return min
}
