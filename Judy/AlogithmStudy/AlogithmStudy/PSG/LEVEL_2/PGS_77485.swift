//
//  PGS_77485.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/21.
//  https://school.programmers.co.kr/learn/courses/30/lessons/77485

import Foundation

func answer_PGS_행렬테두리회전하기(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var matrix = [Array(1...columns)] + Array(1...rows).map { Array(($0*columns+1)...($0+1)*columns) }
    let queryList = queries.map { $0.map { $0 - 1 }}
    var pres = [Int](), result = [Int]()
    var tmp = 0
    var pre = 0 {
        didSet {
            pres.append(pre)
        }
    }
    
    for query in queryList {
        let startRow = query[0]
        let startColumn = query[1]
        let endRow = query[2]
        let endColumn = query[3]
        
        pre = matrix[startRow][startColumn]
        
        for c in (startColumn+1)...endColumn {
            tmp = matrix[startRow][c]
            matrix[startRow][c] = pre
            pre = tmp
        }

        for r in (startRow+1)...endRow {
            tmp = matrix[r][endColumn]
            matrix[r][endColumn] = pre
            pre = tmp
        }

        for c in stride(from: endColumn-1, through: startColumn, by: -1) {
            tmp = matrix[endRow][c]
            matrix[endRow][c] = pre
            pre = tmp
        }
        
        for r in stride(from: endRow-1, through: startRow, by: -1) {
            tmp = matrix[r][startColumn]
            matrix[r][startColumn] = pre
            pre = tmp
        }
        
        result.append(pres.min() ?? 0)
        pres.removeAll()
    }
    
    return result
}
