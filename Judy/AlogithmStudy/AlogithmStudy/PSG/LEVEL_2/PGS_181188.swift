//
//  PGS_181188.swift
//  AlogithmStudy
//
//  Created by 김주영 on 6/13/24.
//

import Foundation

func answer_PGS_요격시스템(_ targets:[[Int]]) -> Int {
    let sortedTargets = targets.sorted(by: { ($0[0], $0[1]) < ($1[0], $1[1]) }) // 시작위치가 작은 순으로 정렬
    var targetStack: [(start: Int, end: Int)] = []
    var index = 0 // 현재 조정하고 있는 범위의 인덱스
    
    for target in sortedTargets {
        let start = target[0]
        let end = target[1]
        
        if targetStack.isEmpty {
          // 범위 리스트가 비어있으면 추가
            targetStack.append((start: start, end: end))
            continue
        }
        
        if start >= targetStack[index].end { // 겹치는 범위가 아니면
            targetStack.append((start: start, end: end)) // 새로운 범위로 추가
            index += 1 // 추가한 범위로 순서 이동
            continue
        }
        
        // 겹치는 범위를 가졌다면 더 작은 교집합 범위로 업데이트
        targetStack[index] = (start: max(targetStack[index].start, start), end: min(targetStack[index].end, end))
    }
    
    return targetStack.count
}
