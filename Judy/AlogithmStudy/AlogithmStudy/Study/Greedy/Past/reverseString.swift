//
//  reverseString.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/04.
//

import Foundation

func reverseString() {
    let numbers = readLine()!
    var before = numbers.first!
    var count = 1
    
    for i in numbers {
        if i != before {
            count += 1
            before = i
        }
    }
    
    print(count / 2)
}

