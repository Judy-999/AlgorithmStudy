//
//  PllarAndBeam.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/09/06.
//

import Foundation
// +7
// 기둥은 위로, 보는 오른쪽으로
func pllarAndBeam(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    
    for frame in build_frame {
        let x = frame[0]
        let y = frame[1]
        let structure = frame[2] // 구조물 (기둥 = 0, 보 = 1)
        let type = Structure(rawValue: frame[2])
        
        if Work(rawValue: frame[3]) == .add { // 추가일 때  // 작업 (추가, 삭제)
            let okPallar = type == .pllar && checkPllar(x, y, result) // 기둥 && 가능
            let okBeam = type == .beam && checkBeam(x, y, result) // 보 && 가능
            
            if okPallar || okBeam {
                result.append([x, y, structure])
            }
            
            continue
        }
        
        // 삭제일 때
        if let index = result.firstIndex(of: [x, y, structure]) { // 일단 빼기
            result.remove(at: index)
        }
        
        let newResult = result.map { // 남은 구조물이 규칙을 만족하는지
            let x = $0[0]
            let y = $0[1]
            
            if Structure(rawValue: $0[2]) == .beam {
                return checkBeam(x, y, result)
            } else {
                return checkPllar(x, y, result)
            }
        }
        
        if newResult.contains(false) { // 하나라도 불가능하면 다시 추가
            result.append([x, y, frame[2]])
        }
    }
    
    return result.sorted { ($0[0], $0[1], $0[2]) < ($1[0], $1[1], $1[2]) }
}


func checkPllar(_ x: Int, _ y: Int, _ map: [[Int]]) -> Bool {
    // 바닥 || 본인이 == 1 || 왼쪽 == 1 || 아래가 == 0
    if y == 0 // 바닥이거나
        || map.contains([x - 1, y, 1]) // 왼쪽에 보가 있거나
        || map.contains([x, y, 1]) // 현재 위치에 보가 있거나
        || map.contains([x, y - 1, 0]) { // 아래에 기둥이 있거나
        return true
    }
    
    return false
}

func checkBeam(_ x: Int, _ y: Int, _ map: [[Int]]) -> Bool {
    // 아래가 == 0 || 오른쪽 아래가 == 0 || (왼쪽이 == 1 && 오른쪽이 == 1)
    if map.contains([x + 1, y - 1, 0]) // 오른쪽에 기둥
        || (map.contains([x - 1, y, 1]) && map.contains([x + 1, y, 1])) // 양쪽이 보
        || map.contains([x, y - 1, 0]) { // 왼쪽에 기둥
        return true
    }

    return false
}

enum Structure: Int {
    case pllar = 0
    case beam = 1
}

enum Work: Int {
    case delete = 0
    case add = 1
}



// MARK: - 처음 시도 버전

func pllarAndBeam1(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var map: [[Int]] = Array(
        repeating: Array(repeating: -1, count: n + 1),
        count: n + 1
    )
    
    for frame in build_frame {
        let x = n - frame[1]
        let y = frame[0]
        let structure = Structure(rawValue: frame[2])
        let how = Work(rawValue: frame[3])
        
        if how == .add {
            if structure == .pllar && checkPllar(n, x, y, map) {
                map[x][y] = map[x][y] == -1 ? Structure1.pllar.rawValue : Structure1.both.rawValue
                continue
            }
            
            if structure == .beam && checkBeam(n, x, y, map) {
                map[x][y] = map[x][y] == -1 ? Structure1.beam.rawValue : Structure1.both.rawValue
                continue
            }
        }
        
        var newMap = map
        if map[x][y] == Structure1.both.rawValue {
            newMap[x][y] = structure == .pllar ? Structure.beam.rawValue : Structure.pllar.rawValue
        } else {
            newMap[x][y] = -1
        }
        
        var check = true
        
        if structure == .pllar { // 위아래 체크 + 본인
            if x < n, newMap[x + 1][y] != -1 {
                if newMap[x + 1][y] == Structure.pllar.rawValue {
                    check = check && checkPllar(n, x + 1, y, newMap)
                } else {
                    check = check && checkBeam(n, x + 1, y, newMap)
                }
            }
            
            if x > 0, newMap[x - 1][y] != -1 {
                if newMap[x - 1][y] == Structure.pllar.rawValue {
                    check = check && checkPllar(n, x - 1, y, newMap)
                } else {
                    check = check && checkBeam(n, x - 1, y, newMap)
                }
            }
            
            if newMap[x][y] != -1 {
                if newMap[x][y] == Structure.pllar.rawValue {
                    check = check && checkPllar(n, x, y, newMap)
                } else {
                    check = check && checkBeam(n, x, y, newMap)
                }
            }
        }
        
        if structure == .beam { // 양 옆 체크 + 본인
            if y < n, newMap[x][y + 1] != -1 {
                if newMap[x][y + 1] == Structure.pllar.rawValue {
                    check = check && checkPllar(n, x, y + 1, newMap)
                } else {
                    check = check && checkBeam(n, x, y + 1, newMap)
                }
            }
            
            if y > 0, newMap[x][y - 1] != -1 {
                if newMap[x][y + 1] == Structure.pllar.rawValue {
                    check = check && checkPllar(n, x, y - 1, newMap)
                } else {
                    check = check && checkBeam(n, x, y - 1, newMap)
                }
            }
            
            if newMap[x][y] != -1 {
                if newMap[x][y] == Structure.pllar.rawValue {
                    check = check && checkPllar(n, x, y, newMap)
                } else {
                    check = check && checkBeam(n, x, y, newMap)
                }
            }
        }
        
        if check {
            map = newMap
        }
    }
    

    
    var result: [[Int]] = []
    
    map.enumerated().forEach { (row, array) in
        array.enumerated().forEach { (column, value) in
            if value != -1 {
                if value == Structure1.both.rawValue {
                    result.append([column, n - row, 0])
                    result.append([column, n - row, 1])
                } else {
                    result.append([column, n - row, value])
                }
            }
        }
    }
    print(map)
    return result.sorted { ($0[0], $0[1], $0[2]) < ($1[0], $1[1], $1[
        2]) }
}

func checkPllar(_ n: Int, _ x: Int, _ y: Int, _ map: [[Int]]) -> Bool {
    // 바닥 || 본인이 == 1 || 왼쪽 == 1 || 아래가 == 0
    if x == n {
        return true
    }
    
    if x < n {
        return map[x + 1][y] == 0
    }
    
    if y > 0 {
        return map[x][y - 1] == 1
    }
    
    if map[x][y] == 1 {
        return true
    }
    
    return false
}

func checkBeam(_ n: Int, _ x: Int, _ y: Int, _ map: [[Int]]) -> Bool {
    // 아래가 == 0 || 오른쪽 아래가 == 0 || (왼쪽이 == 1 && 오른쪽이 == 1)
    if x < n {
        if map[x + 1][y] == 0 {
            return true
        }
        if y < n {
            if map[x + 1][y + 1] == 0 {
                return true
            }
        }
    }
    
    if y < n && y > 0 {
        if map[x][y + 1] == 1 && map[x][y - 1] == 1 {
            return true
        }
    }
    
    return false
}


enum Structure1: Int {
    case pllar = 0
    case beam = 1
    case both = 2
}



//[-1,-1,-1,-1,-1,-1]
//[-1,-1,-1,-1,-1,-1]
//[-1,-1,-1,-1,-1,-1]
//[-1,-1,-1,-1,-1,-1]
//[-1,0,-1,-1,-1,-1]
//
//[[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]]
//
//0 -> 아래가 > n || 아래 왼쪽이 == 1 이나 0 (!= -1)
//1 -> 아래가 == 0 || 오른쪽 아래가 == 0 || (왼쪽이 == 1 && 오른쪽이 == 1)

//[[-1, -1, -1, -1, -1, -1],
// [-1, -1, -1, -1, -1, -1],
// [-1, -1, -1, -1, -1, -1],
// [-1, -1,  1,  1,  1, -1],
// [-1,  1,  0, -1, -1,  0],
// [-1,  0, -1, -1, -1,  0]]
