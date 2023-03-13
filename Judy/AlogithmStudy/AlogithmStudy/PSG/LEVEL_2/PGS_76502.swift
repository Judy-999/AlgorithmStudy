//
//  PGS_76502.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/13.
//

import Foundation

func answer_PGS_괄호회전하기(_ s:String) -> Int {
    var rotation = 0
    var brackets = s
    var result = 0
    
    while rotation < s.count {
        let first = String(brackets.removeFirst())
        let test = brackets + first
        brackets = test
        
       if check(test) {
           result += 1
       }
        
        rotation += 1
    }
    
    return  result
}

func check(_ s: String) -> Bool {
    let opening = ["(", "{", "["]
    let close = [")", "}", "]"]
    var stack = [String]()
    
    for bracket in s {
        if let index = opening.firstIndex(of: String(bracket)) {
            stack.append(close[index])
            continue
        }
        
        if stack.popLast() != String(bracket) {
            return false
        }
    }
    
    return stack.isEmpty
}
