//
//  BOJ_10828.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/20/24.
//

import Foundation

func answer_스택_10828() {
    var stack: [Int] = []
    let number = Int(readLine()!)!
    let commands: [[String]] = (0..<number).map { _ in readLine()!.components(separatedBy: " ") }
    
    for input in commands {
        if let command = Command(rawValue: input[0]) {
            switch command {
            case .push:
                if let num = Int(input[1]) {
                    push(num)
                }
            case .pop:
                print(pop())
            case .size:
                print(size())
            case .empty:
                print(empty())
            case .top:
                print(top())
            }
        }
    }
    
    func push(_ n: Int) {
        stack.append(n)
    }
    
    func pop() -> Int {
        if let num = stack.popLast() {
            return num
        }
        return -1
    }
    
    func size() -> Int {
        return stack.count
    }
    
    func empty() -> Int {
        return stack.isEmpty ? 1 : 0
    }
    
    func top() -> Int {
        if let num = stack.last {
            return num
        }
        return -1
    }
}

enum Command: String {
    case push
    case pop
    case size
    case empty
    case top
}
