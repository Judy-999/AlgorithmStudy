//
//  BOJ_2775.swift
//  AlogithmStudy
//
//  Created by 김주영 on 10/14/24.
//

import Foundation

func answer_BOJ_부녀회장이될테야_2775() {
    let testCases = Int(readLine()!)!
    var kList: [Int] = []
    var nList: [Int] = []
    
    (0..<testCases * 2).forEach { i in
        if i % 2 == 0 {
            kList.append(Int(readLine()!)!)
        } else {
            nList.append(Int(readLine()!)!)
        }
    }
    
    let (k, n) = (kList.max()!, nList.max()!)
    var counts: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)
    counts[0] = Array(0...n)
    
    for j in 1...k {
        for i in 1...n {
            counts[j][i] = counts[j - 1][i] + counts[j][i - 1]
        }
    }
    
    for (k, n) in zip(kList, nList) {
        print(counts[k][n])
    }
}

// 1, 2, 3, 4...
// 1층 3호 - 0층의 1호부터 3호까지
// 1, 2, 3 => 6
// 2층의 3호 => 1층의 1호부터 3호까지
// 1, 3, 6 => 10

// k층의 n호 => k - 1 층의 1호부터 n호까지
// k - 1 층의 n호 -> (k - 1 층의 n - 2호 + k - 1 층의 n - 1호)
