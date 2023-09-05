//
//  StringRearrange.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/09/06.
//

import Foundation

func stringRearrange() -> String {
    let strings = readLine()!
    let sum = strings.compactMap { Int(String($0)) }.reduce(0, +)
    let alphavets = strings.filter { Int(String($0)) == nil }
    let sortedAlphavets = alphavets.sorted(by: <).reduce(into: "") { $0 += String($1) }
    
    return sortedAlphavets + String(sum)
}
