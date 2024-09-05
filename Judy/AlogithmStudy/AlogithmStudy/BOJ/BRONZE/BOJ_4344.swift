//
//  BOJ_4344.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/5/24.
//

import Foundation

func answer_BOJ_평균은넘겠지_4344() {
    let count = Int(readLine()!)!
    let totalLine: [[Double]] = (0..<count).map { _ in readLine()!.split(separator: " ").compactMap { Double($0) } }
    
    totalLine.forEach { numbers in
        let average = numbers[1...].reduce(0, +) / numbers[0]
        let overStudents = numbers[1...].filter { $0 > average }
        let value = round((Double(overStudents.count) / numbers[0] * 100000.0)) / 1000.0
        print(String(format: "%.3f", value) + "%")
    }
}
