//
//  BOJ_1010.swift
//  AlogithmStudy
//
//  Created by 김주영 on 10/14/24.
//

import Foundation

func answer_BOJ_다리놓기_1010() {
    let testCount = Int(readLine()!)!
    var testCases: [[Int]] = []
    
    (1...testCount).forEach { _ in
        let mn = readLine()!.split(separator: " ").compactMap { Int($0) }
        testCases.append([mn[0], mn[1]])
    }

    for testCase in testCases {
        let (m, n) = (testCase[1], testCase[0])
        var result = 1

        for (i, j) in zip((m - n + 1)...m, 1...n) {
            result *= i
            result /= j
        }
        print(result)
    }
}

func answer_BOJ_다리놓기_1010_2() {
    let testCount = Int(readLine()!)!
    var mList = [Int]()
    var nList = [Int]()
    
    (1...testCount).forEach { _ in
        let mn = readLine()!.split(separator: " ").compactMap { Int($0) }
        nList.append(mn[0])
        mList.append(mn[1])
    }
    
    let (mMax, nMax) = (mList.max()!, nList.max()!)
    var dp = Array(repeating: Array(repeating: 0, count: nMax + 1), count: mMax + 1)
    
    // 초기 조건 설정
    for i in 0...mMax {
        dp[i][0] = 1  // 아무것도 선택하지 않는 경우
        if i <= nMax {
            dp[i][i] = 1  // 모든 원소를 선택하는 경우
        }
    }
    
    // DP 점화식을 이용해 테이블 채우기
    for i in 1...mMax {
        for j in 1...min(i, nMax) {
            dp[i][j] = dp[i-1][j-1] + dp[i-1][j]
        }
    }
    
    for (m, n) in zip(mList, nList) {
        // 결과 반환
        print(dp[m][n])
    }
}

// m 개중 n개를 고를 경우의 수 (순서없음)
// m! / (m - n)! * n!

// 디피로 푸는 방법

//초기 조건
//- 0 개일 때는 1
//- 같은 수를 고를 때는 1
//
//10개 중 5개 뽑기 = 9개중 4개 뽑기 + 9개중 5개 뽑기
//  dp[i][j] = dp[i-1][j-1] + dp[i-1][j]
//1. 특정 하나를 고른 경우 그 외에 9 개중 4개 뽑는 방법
//2. 특정 하나를 포함하지 않는 경우 9 개중 5개 뽑는 방법
