//
//  MakeOne.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/10/26.
//

import Foundation

func makeOne() {
    var number = Int(readLine()!)!
    let max = number
    var dic = [Int: Int]()
    
    dic[number] = 0
    
    while dic[1] == nil,
          let currentCount = dic[number] {
        if number % 5 == 0 {
            let nextNumber = number / 5
            dic[nextNumber] = min(dic[nextNumber] ?? max, currentCount + 1)
        }
        
        if number % 3 == 0 {
            let nextNumber = number / 3
            dic[nextNumber] = min(dic[nextNumber] ?? max, currentCount + 1)
        }
        
        if number % 2 == 0 {
            let nextNumber = number / 2
            dic[nextNumber] = min(dic[nextNumber] ?? max, currentCount + 1)
        }
        
        let nextNumber = number - 1
        dic[nextNumber] = min(dic[nextNumber] ?? max, currentCount + 1)
        
        number -= 1
    }
    
    print(dic[1]!)
}


// 입력 : 26
// 결과 : 3
