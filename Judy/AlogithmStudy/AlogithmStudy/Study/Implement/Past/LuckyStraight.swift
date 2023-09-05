//
//  LuckyStraight.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/09/04.
//

import Foundation

func luckyStraight() -> String {
    let number = readLine()!
    let count = number.count
    var left = 0
    var right = 0
    
    for (index, num) in number.enumerated() {
        if index < count / 2 {
            left += Int(String(num))!
        } else {
            right += Int(String(num))!
        }
    }
    
    return left == right ? "LUCKY" : "READY"
}
