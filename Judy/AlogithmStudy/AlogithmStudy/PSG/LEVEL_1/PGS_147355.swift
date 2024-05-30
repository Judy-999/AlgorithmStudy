//
//  PGS_147355.swift
//  AlogithmStudy
//
//  Created by Judy on 2023/01/19.
//

import Foundation

func answer_PGS_크기가작은부분문자열(_ t:String, _ p:String) -> Int {
    let number = Int(p)!
    let count = p.count
    var startIndex = t.startIndex
    var endIndex = t.index(startIndex, offsetBy: count-1)
    var result = 0
    
    while endIndex != t.endIndex {
        if Int(String(t[startIndex...endIndex]))! <= number {
            result += 1
        }
        
        startIndex = t.index(startIndex, offsetBy: 1)
        endIndex = t.index(startIndex, offsetBy: count-1)
    }
    
    return result
}

// 스터디로 새로운 풀이

func answer_PGS_크기가작은부분문자열2(_ t:String, _ p:String) -> Int {
    var text = t
    var result = 0
    guard let first = p.first, // P의 첫 번째 숫자
          let firstNumber = Int(String(first)) else { return 0 }
    
    while text.count >= p.count { // p의 자리수 이상 남아있다면
        // 현재 위치의 첫 숫자가 p의 첫 숫자보다 작거나 같으면
        if let nextNumber = Int(String(text.first!)), nextNumber <= firstNumber {
            // p의 자리수 만큼 만든 숫자
            let numberText = text[text.startIndex..<text.index(text.startIndex, offsetBy: p.count)]
            if let number = Int(numberText), number <= Int(p)! { // p보다 작은지 비교
                result += 1
            }
        }
        text.removeFirst()
    }
    
    return result
}
