//
//  PGS_118667.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/06.
//  https://school.programmers.co.kr/learn/courses/30/lessons/118667#

import Foundation

// 질문 참고함
// 큐처럼 풀지않고 포인트처럼 풀어야 함
func answer_PGS_두큐합같게만들기(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let allQueue = queue1 + queue2
    var count = 0
    var sum1 = queue1.reduce(0, +), sum2 = queue2.reduce(0, +)
    let max = sum1 + sum2 / 2
    var s1 = allQueue.count / 2
    var s2 = 0
    
    if (sum1 + sum2) % 2 != 0
    || queue1.contains(where: { $0 > max })
    || queue2.contains(where: { $0 > max }) {
        return -1
    }
    
    while sum1 != sum2  {
        if s2 >= allQueue.count || s1 <= s2  { return -1 }
        if s1 == allQueue.count { s1 = 0 }
        
        if sum1 > sum2 {
            sum1 -= allQueue[s2]
            sum2 += allQueue[s2]
            s2 += 1
        } else {
            sum2 -= allQueue[s1]
            sum1 += allQueue[s1]
            s1 += 1
        }
        
        count += 1
    }
    
    return count
}
