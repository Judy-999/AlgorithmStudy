//
//  BOJ_3040.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/5/24.
//

import Foundation

func answer_BOJ_백설공주와일곱난쟁이_3040() {
    let nineHats: [Int] = (0..<9).compactMap { _ in Int(readLine()!) }
    var i = 0
    
    while i < 9 {
        for num in (i + 1)..<9 {
            let sum = nineHats.filter { $0 != nineHats[i] && $0 != nineHats[num] }
            if sum.reduce(0, +) == 100 {
                print(sum.map { String($0) }.joined(separator: "\n"))
                return
            }
        }
        
        i += 1
    }
}
