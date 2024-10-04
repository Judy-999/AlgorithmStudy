//
//  BOJ_11399.swift
//  AlogithmStudy
//
//  Created by 김주영 on 10/4/24.
//

import Foundation

func answer_BOJ_ATM_11399() {
    let count = Int(readLine()!)!
    let timeList = readLine()!.split(separator: " ").compactMap { Int($0) }
    let sorted = timeList.sorted(by: <)
    print(sorted.enumerated().reduce(0, { $0 + $1.element * (count - $1.offset) }))
}

//1 2 3 3 4
//
//1
//1 + 2
//1 + 2 + 3
//1 + 2 + 3 + 3
//1 + 2 + 3 + 3 + 4
