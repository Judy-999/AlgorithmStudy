//
//  LowerGrade.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/10/12.
//

import Foundation

func lowerGrade() {
    let studentCount: Int = Int(readLine()!)!
    var students: [(String, Int)] = []
    
    for _ in 0..<studentCount {
        let grade = readLine()!.components(separatedBy: " ")
        students.append((grade[0], Int(grade[1])!))
    }
    
    let result = students.sorted(by: { $0.1 < $1.1 }).map { $0.0 }.joined(separator: " ")
    print(result)
}
