//
//  WallInspection.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/09/11.
//

import Foundation

func wallInspection(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    let 취약지점리스트 = weak + weak.map { $0 + n }.dropLast()
    var 일할수있는친구들 = dist
    var 일할친구들 = [일할수있는친구들.popLast()!]
    
    var 가능한친구들순서 = permutation(일할친구들)
    
    while true {
        for 친구순서 in 가능한친구들순서 {
            for 시작지점 in 0..<weak.count { // 시작 위치만 바꿔서 취약 개수만큼
                var 현재위치 = 시작지점
                var 사용할친구들 = 친구순서
                
                while let 갈수있는거리 = 사용할친구들.popLast() {
                    let 갈수있는위치 = 취약지점리스트[현재위치] + 갈수있는거리
                    
                    while 취약지점리스트[현재위치] <= 갈수있는위치 {
                        현재위치 += 1
                        if 현재위치 - 시작지점 == weak.count { // 취약 개수만큼 다 갔다면
                            return 일할친구들.count
                        }
                    }
                }
            }
        }
        
        if let 다음친구 = 일할수있는친구들.popLast() {
            일할친구들.append(다음친구)
            가능한친구들순서 = permutation(일할친구들)
        } else {
            return -1
        }
    }
}

func permutation(_ data: [Int]) -> [[Int]] {
    var visit = Array(repeating: false, count: data.count)
    var chances: [[Int]] = []
    
    func dfs(current: Int, answer: [Int]) {
        if data.count == answer.count {
            chances.append(answer)
            return
        }
        
        for i in 0..<data.count {
            if !visit[i] {
                visit[i] = true
                dfs(current: i, answer: answer + [data[i]])
                visit[i] = false
            }
        }
    }
    
    dfs(current: 0, answer: [])
    return chances
}
