//
//  PGS_17681.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/14.
//  https://school.programmers.co.kr/learn/courses/30/lessons/17681

import Foundation

func answer_PGS_비밀지도(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    let firstMap = makeMap(n, arr1)
    let secondMap = makeMap(n, arr2)
    var result = [String]()
    
    for (first, second) in zip(firstMap, secondMap) {
        let f = first.compactMap { Int(String($0)) }
        let s = second.compactMap { Int(String($0)) }
        let map = zip(f, s).map {
            if $0 + $1 == 0 { return " " }
            return "#"
        }

        result.append(map.joined())
    }
    
    return result
}

func makeMap(_ n: Int, _ arr: [Int]) -> [String] {
    return arr.map { String($0, radix: 2) }.map { binary in
        return String(repeating: "0", count: n - binary.count) + binary
    }
}

// 참고할 만한 답변, 먼저 |을 하고 reduce를 사용하면 간경하다
//func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
//    var ret = [String]()
//    for i in 0..<n {
//        var retArray = String(arr1[i] | arr2[i], radix: 2)
//        retArray = retArray.replacingOccurrences(of: "1", with: "#")
//        ret.append(String.init(repeating: " ", count: n - retArray.count) + retArray.replacingOccurrences(of: "0", with: " "))
//    }
//    return ret
//}
