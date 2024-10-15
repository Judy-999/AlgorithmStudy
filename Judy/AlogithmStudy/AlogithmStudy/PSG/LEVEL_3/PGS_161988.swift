//
//  PGS_161988.swift
//  AlogithmStudy
//
//  Created by 김주영 on 10/15/24.
//

import Foundation

func answer_PGS_연속펄스부분수열의합(_ sequence:[Int]) -> Int64 { // +3
    let sequence1 = sequence.enumerated().map { $0.offset % 2 == 0 ? Int64($0.element) : Int64($0.element) * (-1) }
    let sequence2 = sequence.enumerated().map { $0.offset % 2 != 0 ? Int64($0.element) : Int64($0.element) * (-1) }

    var dp: [Int64] = sequence2 // n를 끝으로 하는 부분 수열의 합
    for i in 1..<sequence.count {
        dp[i] = max(dp[i], dp[i - 1] + sequence2[i]) // 현재 최대 vs 이번 값을 포함시켰을 때
    }
    
    var dp2: [Int64] = sequence1
    for i in 1..<sequence.count {
        dp2[i] = max(dp2[i], dp2[i - 1] + sequence1[i])
    }

    return max(dp.max()!, dp2.max()!)
}

// [1, -1, 1 ...] 또는 [-1, 1, -1 ...]
// 부분 수열의 합 중 최대 (길이 상관 없음)

// [2, -3, -6, -1, 3, 1, 2, -4]
// [-2, 3, 6, 1, -3, -1, -2, 4] => 연속된 양수의 최대 (근데 -1 다음 100이 있음 넣는게 낫지)
