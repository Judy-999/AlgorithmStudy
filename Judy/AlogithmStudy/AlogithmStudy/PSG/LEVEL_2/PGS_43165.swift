//
//  PGS_43165.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/12.
//  https://school.programmers.co.kr/learn/courses/30/lessons/43165

import Foundation

func answer_PGS_타켓넘버(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    
    func dfs(_ num: Int, _ depth: Int) {
        if depth == numbers.count {
            if num == target { count += 1 }
            return
        }
        
        dfs(num + numbers[depth], depth + 1)
        dfs(num - numbers[depth], depth + 1)
    }
    
    dfs(0, 0)
    
    return count
}
