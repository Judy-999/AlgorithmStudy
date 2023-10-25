//
//  PGS_64065.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/29.
//  https://school.programmers.co.kr/learn/courses/30/lessons/64065
 
import Foundation

// 딕셔너리 활용 버전
func answer_PGS_튜플(_ s:String) -> [Int] {
    let tuples = s.filter { $0 != "{" && $0 != "}"}
                  .components(separatedBy: ",")
                  .compactMap { Int(String($0)) }
 
    var numbers = [Int: Int]()
    
    tuples.forEach {
        numbers[$0] = (numbers[$0] ?? 0) + 1
    }
    
    return numbers.sorted(by: { $0.value > $1.value }).map { $0.key }
}

//처음 제출 코드
//func solution(_ s:String) -> [Int] {
//    var tuples = s.filter { $0 != "{" && $0 != "}"}.components(separatedBy: ",").compactMap { Int(String($0)) }.sorted(by: <)
//    var numbers = [[Int]]()
//    var number = tuples.first!
//    var list = [Int]()
//    var result = [Int]()
//
//    for n in tuples {
//        if n != number {
//            numbers.append(list)
//            number = n
//            list = [n]
//        } else {
//            list.append(n)
//        }
//    }
//    numbers.append(list)
//    numbers.sort(by: { $0.count > $1.count })
//
//    numbers.forEach {
//        result.append($0[0])
//    }
//
//    return result
//}
