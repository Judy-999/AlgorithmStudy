//
//  threeInTime.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/28.
//

import Foundation

func threeInTime() {
    let count = Int(readLine()!)!
    var forSixtyMinute = 0
    
    for i in 0..<54 {
        if String(i).contains("3") {
            forSixtyMinute += 1
        }
    }
    let forOneHour = forSixtyMinute * 60 * 2 - forSixtyMinute * forSixtyMinute
    let threeTime = 60 * 60
    var result = 0
    
    for c in 0..<(count + 1) {
        if String(c).contains("3") {
            result += threeTime
            continue
        }
        
        result += forOneHour
    }
    
    print(result)
}
