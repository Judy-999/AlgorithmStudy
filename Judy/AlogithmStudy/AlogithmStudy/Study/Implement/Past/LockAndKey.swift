//
//  LockAndKey.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/09/14.
//

import Foundation

func lockAndKey(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    let n = key.count
    let base = Array(repeating: 0, count: 3 * n - 2)
    let lastPoint = 2 * n - 2
    var keyType = [[Int]]()
    
    for i in 0..<(3 * n - 2) { // 테두리에 0을 Key 크기보다 1 작게 감싸줌
        if i < n - 1 || i > lastPoint { // 인덱스가 0부터 시작이라 1씩 빼줌
            keyType.append(base)
        } else {
            let zeroBase = Array(repeating: 0, count: n - 1)
            let keyLine = zeroBase + key[i - (n - 1)] + zeroBase
            keyType.append(keyLine)
        }
    }
    
    for _ in 0..<4 {
        for xPoint in 0..<(lastPoint + 1) {
            for yPoint in 0..<(lastPoint + 1) {
                var testKey = [[Int]]()
                
                for i in 0..<n { // key 조합
                    let testLine = Array(keyType[xPoint + i][yPoint..<(yPoint + n)])
                    testKey.append(testLine)
                }
                
//                if checkKey(testKey, lock) {
//                    return true
//                }
            }
        }
        
        keyType = turnRight(keyType) // 오른쪽 회전
    }
    
    return false
}

func checkKey(_ keys: [[Int]], _ locks: [[Int]], _ x: Int, _ y: Int) -> Bool {
    var newLocks = Array(repeating: Array(repeating: 0, count: locks.count * 3), count: locks.count * 3)
    
//    for i in 0..<keys.count {
//        for j in 0..<locks.count {
//            newLocks[x + i + locks.count][y + j + locks.count] += key[i][j]
//        }
//    }
    
    
    for (keyLine, lockLine) in zip(keys, locks) {
        for (key, lock) in zip(keyLine, lockLine) {
            if key + lock != 1 {
                return false
            }
        }
    }
    return true
}

func turnRight(_ array: [[Int]]) -> [[Int]] {
    var new = Array(repeating: [Int](), count: array.count)
    
    for x in 0..<array.count {
        for y in 0..<array.count {
            new[x].append(array[y][x])
        }
    }
    
    return new.map { $0.reversed() }
}

// [0, 0, 0]
// [1, 0, 0]  => [[0, 0, 0], [1, 0, 0], [0, 1, 1]]
// [0, 1, 1]

// [1, 1, 1]
// [1, 1, 0]
// [1, 0, 1]

//---

// [1*, 0, 0] (2 ,2)
// [0, 0, 0]
// [0, 0, 0]

// [0*, 0, 0] (1 ,2)
// [1*, 0, 0] (2 ,2)
// [0, 0, 0]

// [0*, 0, 0] (0, 2)
// [0*, 0, 0] (1, 2)
// [1*, 0, 0] (2, 2)

// [0, 0, 0]
// [0*, 0, 0] (0, 2)
// [0*, 0, 0] (1, 2)

// [0, 0, 0]
// [0, 0, 0]
// [0*, 0, 0] (0, 2)

//---

// [0, 0, 0,  0,  0,  0, 0],
// [0, 0, 0,  0,  0,  0, 0],
// [0, 0, 0*, 0*, 0*, 0, 0],
// [0, 0, 1*, 0*, 0*, 0, 0],
// [0, 0, 0*, 1*, 1*, 0, 0],
// [0, 0, 0,  0,  0,  0, 0],
// [0, 0, 0,  0,  0,  0, 0]

// (n-1) + n + (n-1)






//func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
//    let m = key.count
//    let n = lock.count
//    let base = Array(repeating: 0, count: m + 2 * n - 2)
//    let lastPoint = m + n - 2
//    var keyType = [[Int]]()
//
//    for i in 0..<(m + 2 * n - 2) {
//        if i < m - 1 || i > lastPoint {
//            keyType.append(base)
//        } else {
//            let zeroBase = Array(repeating: 0, count: m - 1)
//            let keyLine = zeroBase + key[i - (m - 1)] + zeroBase
//            keyType.append(keyLine)
//        }
//    }
//
//    for _ in 0..<4 {
//        for xPoint in 0..<(lastPoint + 1) {
//            for yPoint in 0..<(lastPoint + 1) {
//                var testKey = [[Int]]()
//
//                for i in 0..<m {
//                    let testLine = Array(keyType[xPoint + i][yPoint..<(yPoint + m)])
//                    testKey.append(testLine)
//                }
//
//                if checkKey(testKey, lock) {
//                    return true
//                }
//            }
//        }
//
//        keyType = turnRight(keyType)
//    }
//
//    return false
//}
//
//func checkKey(_ keys: [[Int]], _ locks: [[Int]]) -> Bool {
//    for (keyLine, lockLine) in zip(keys, locks) {
//        for (key, lock) in zip(keyLine, lockLine) {
//            if key + lock != 1 {
//                return false
//            }
//        }
//    }
//    return true
//}
//
//func turnRight(_ array: [[Int]]) -> [[Int]] {
//    var new = Array(repeating: [Int](), count: array.count)
//
//    for x in 0..<array.count {
//        for y in 0..<array.count {
//            new[x].append(array[y][x])
//        }
//    }
//
//    return new.map { $0.reversed() }
//}


//lockAndKey([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]])

//print(turnRight([[0, 0, 0], [1, 0, 0], [0, 1, 1]]))
