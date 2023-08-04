//
//  multiplyOrAdd.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/04.
//

import Foundation

func multiplyOrAdd() -> Int {
    let numbers = readLine()!.compactMap { Int(String($0)) }
    var result = 0
    
    for number in numbers {
        let add = result + number
        let multi = result * number
        result = add > multi ? add : multi
    }
    
    return result
}
