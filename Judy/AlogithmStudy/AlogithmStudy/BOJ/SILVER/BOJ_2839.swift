//
//  BOJ_2839.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/24/24.
//

import Foundation

func answer_BOJ_설탕배달_2839() {
    let target = Int(readLine()!)!
    var dict: [Int: Int] = [:]
    
    dict[3] = 1
    dict[5] = 1
    
    for t in 3...target {
        if dict[t - 3] == nil, dict[t - 5] == nil {
            continue
        }
        
        dict[t] = min(dict[t - 3, default: target] + 1, dict[t - 5, default: target] + 1)
    }
    
    print(dict[target] ?? -1)
}

// 3 / 5
// 최대한 적은 수로 분배하기
// 이전 값에서 하나씩 더할 수록 +1 (이전 값이 어떻게 구성돼있는지 관심없고 최소수만 저장해둠)

// 시간 초과
//func answer_BOJ_설탕배달_2839() {
//    let target = Int(readLine()!)!
//    var count = target
//    
//    func dfs(_ num: Int, _ depth: Int) {
//        guard num <= target else { return }
//        
//        if num == target {
//            count = min(count, depth)
//            return
//        }
//        
//        dfs(num + 3, depth + 1)
//        dfs(num + 5, depth + 1)
//    }
//    
//    dfs(0, 0)
//    print(count == target ? -1 : count)
//}
