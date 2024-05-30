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

// 스터디로 새로운 풀이
func answer_PGS_괄호회전하기2(_ s:String) -> Int {
    let openSymbols: [String] = ["(", "{", "["] // 여는 괄호 모음
    var index = s.startIndex
    var result = 0
    
    while index < s.endIndex {
            // 처음이 여는 괄호가 아니면 어차피 옳게 될 수 없으므로 여는 괄호 순서일 때
        if openSymbols.contains(String(s[index])) {
                // 해당 순서만큼 잘라서 뒤에 붙이기
            let newWords = String(s[index..<s.endIndex]) + String(s[s.startIndex..<index])
            result += isCorrect(newWords) ? 1 : 0  // 옳은 배열이면 +1
        }
        
        index = s.index(after: index) // 순서를 한 칸 뒤로
    }
    
    return result
}

func isCorrect(_ s: String) -> Bool {
    let dic: [String: String] = [")": "(", "}": "{", "]": "["] // 괄호 짝 딕셔너리
    var stack: [String] = []
    var words: String = s

    while !words.isEmpty {
        let next = String(words.removeFirst()) // 문자열에서 하나 빼서
        if stack.isEmpty {
            stack.append(next) // 스택이 비어있는 상태면 바로 넣기
            continue
        }
        
        if let match = dic[next] {
            if stack.last == match { // 닫는 괄호 && 스택의 마지막과 짝이 맞으면
                stack.removeLast() // 스택의 마지막 제거
            } else {
                return false // 짝이 맞지 않으면 옳지 않는 괄호
            }
        } else {
            stack.append(next)  // 닫는 괄호가 아니면 스택에 넣기
        }
    }
    
    return stack.isEmpty // 스택이 비어있으면 옳은 괄호
}
