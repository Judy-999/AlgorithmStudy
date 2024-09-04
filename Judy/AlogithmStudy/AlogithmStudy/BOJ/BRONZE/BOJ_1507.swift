//
//  BOJ_1507.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/4/24.
//

import Foundation


func answer_BOJ_나누기_1507() {
    let target = (Int(readLine()!)! / 100) * 100
    let number = Int(readLine()!)!
    var result = 0
    
    while (target + result) % number != 0 {
        result += 1
    }
    
    print(result > 10 ? String(result) : "0" + String(result))
}

//func answer_BOJ_나누기_1507() {
//    let target = (Int(readLine()!)! / 100) * 100
//    let number = Int(readLine()!)!
//    var result = 0
//
//    while result < 100 {
//        if (target + result) % number == 0 {
//            print(result > 10 ? String(result) : "0" + String(result))
//            return
//        }
//
//        result += 1
//    }
//}
