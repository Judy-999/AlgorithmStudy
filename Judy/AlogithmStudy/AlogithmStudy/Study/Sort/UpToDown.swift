//
//  UpToDown.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/10/12.
//

import Foundation

func upToDown() {
    let numberCount: Int = Int(readLine()!)!
    var numbers: [Int] = []
    
    for _ in 0..<numberCount {
        numbers.append(Int(readLine()!)!)
    }
    
    let result = numbers.sorted(by: >).map { String($0) }.joined(separator: ", ")
    print(result)
}
